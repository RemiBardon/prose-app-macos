RUST_LIB_PATH = ../uniffi_test
RUST_LIB_NAME = uniffi_test
SWIFT_LIB_NAME = ProseCore
BUILD_FOLDER = Build
# TARGET_PREFIX = /x86_64-apple-darwin
TARGET_PREFIX = /aarch64-apple-darwin
# XCFRAMEWORK_PATH = /macos-x86_64
XCFRAMEWORK_PATH = /macos-arm64
XCFRAMEWORK_NAME = "${SWIFT_LIB_NAME}"
# XCFRAMEWORK_NAME = "${SWIFT_LIB_NAME}FFI"

# Inpired by https://betterprogramming.pub/from-rust-to-swift-df9bde59b7cd
# Other useful links:
# - https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary

all: interface framework

interface:
	# Remove old files
	rm -rf "${BUILD_FOLDER}/interface"

	# Generate FFI bindings and `.modulemap`
	uniffi-bindgen generate "${RUST_LIB_PATH}/src/${RUST_LIB_NAME}.udl" \
		-o "${BUILD_FOLDER}/interface" \
		--language swift

	# Add `@_implementationOnly` before Swift `import` statements
	# sed -i '' \
	# 	"s/import ${SWIFT_LIB_NAME}FFI/@_implementationOnly import ${SWIFT_LIB_NAME}FFI/g" \
	# 	"${BUILD_FOLDER}/interface/${SWIFT_LIB_NAME}.swift"

framework:
	# ########## OLD VERSION (with some minor changes) ##########
	# rm -f $(BUILD_FOLDER)/lib$(SWIFT_LIB_NAME).a
	# rm -f $(BUILD_FOLDER)/$(SWIFT_LIB_NAME).a
	# rm -f $(BUILD_FOLDER)/$(SWIFT_LIB_NAME).swiftmodule

	# (cd $(BUILD_FOLDER); swiftc \
	# 	-module-name $(SWIFT_LIB_NAME) \
	# 	-emit-library -o lib$(SWIFT_LIB_NAME).a \
	# 	-emit-module -emit-module-path . \
	# 	-parse-as-library \
	# 	-L $(RUST_LIB_PATH)/target${TARGET_PREFIX}/release \
	# 	-l$(RUST_LIB_NAME) \
	# 	-Xcc -fmodule-map-file=./interface/$(RUST_LIB_NAME)FFI.modulemap \
	# 	-static \
	# 	-enable-library-evolution \
	# 	./interface/$(RUST_LIB_NAME).swift)

	# libtool -static -o $(BUILD_FOLDER)/$(SWIFT_LIB_NAME).a $(BUILD_FOLDER)/lib$(SWIFT_LIB_NAME).a $(RUST_LIB_PATH)/target${TARGET_PREFIX}/release/lib$(RUST_LIB_NAME).a

	# rm -rf ProseCore/ProseCore/$(SWIFT_LIB_NAME).xcframework

	# xcodebuild -create-xcframework \
	# 	-library ./Build/$(SWIFT_LIB_NAME).a \
	# 	-output ProseCore/ProseCore/$(SWIFT_LIB_NAME).xcframework

	# cp Build/$(SWIFT_LIB_NAME).swiftmodule ProseCore/ProseCore/$(SWIFT_LIB_NAME).xcframework${XCFRAMEWORK_PATH}


	# ########## NEW VERSION (WIP) ##########

	# Remove old files
	rm -rf "./ProseCore/Artifacts/${XCFRAMEWORK_NAME}.xcframework"
	rm -f "${BUILD_FOLDER}/lib${SWIFT_LIB_NAME}_macos.a"

	# mkdir "${BUILD_FOLDER}/x86_64-apple-darwin"
	# (cd "${BUILD_FOLDER}"; swiftc \
	# 	-module-name "${SWIFT_LIB_NAME}" \
	# 	-emit-library -o "./x86_64-apple-darwin/lib${SWIFT_LIB_NAME}.a" \
	# 	-emit-module -emit-module-path "./x86_64-apple-darwin/" \
	# 	-parse-as-library \
	# 	-L "../${RUST_LIB_PATH}/target/x86_64-apple-darwin/release" \
	# 	-l "${RUST_LIB_NAME}" \
	# 	-Xcc -fmodule-map-file="./interface/${SWIFT_LIB_NAME}FFI.modulemap" \
	# 	-static \
	# 	"./interface/${SWIFT_LIB_NAME}.swift")
	# 	# -enable-library-evolution \
	# mkdir "${BUILD_FOLDER}/aarch64-apple-darwin"
	# (cd "${BUILD_FOLDER}"; swiftc \
	# 	-module-name "${SWIFT_LIB_NAME}" \
	# 	-emit-library -o "./aarch64-apple-darwin/lib${SWIFT_LIB_NAME}.a" \
	# 	-emit-module -emit-module-path "./aarch64-apple-darwin/" \
	# 	-parse-as-library \
	# 	-L "../${RUST_LIB_PATH}/target/aarch64-apple-darwin/release" \
	# 	-l "${RUST_LIB_NAME}" \
	# 	-Xcc -fmodule-map-file="./interface/${SWIFT_LIB_NAME}FFI.modulemap" \
	# 	-static \
	# 	"./interface/${SWIFT_LIB_NAME}.swift")
	# 	# -enable-library-evolution \

	# === Create fat libraries (for platforms with multiple architectures) ===

	# Group macOS libraries
	lipo -create \
		"${RUST_LIB_PATH}/target/x86_64-apple-darwin/release/lib${RUST_LIB_NAME}.a" \
		"${RUST_LIB_PATH}/target/aarch64-apple-darwin/release/lib${RUST_LIB_NAME}.a" \
		-output "${BUILD_FOLDER}/lib${SWIFT_LIB_NAME}_macos.a"

	# Group iOS Simulator libraries
	# lipo -create \
	# 	"${RUST_LIB_PATH}/target/x86_64-apple-ios/release/lib${RUST_LIB_NAME}.a" \
	# 	"${RUST_LIB_PATH}/target/aarch64-apple-ios-sim/release/lib${RUST_LIB_NAME}.a" \
	# 	-output "${BUILD_FOLDER}/lib${SWIFT_LIB_NAME}_iossimulator.a"

	# Group Mac Catalyst libraries
	# lipo -create \
	# 	"${RUST_LIB_PATH}/target/x86_64-apple-ios-macabi/release/lib${RUST_LIB_NAME}.a" \
	# 	"${RUST_LIB_PATH}/target/aarch64-apple-ios-macabi/release/lib${RUST_LIB_NAME}.a" \
	# 	-output "${BUILD_FOLDER}/lib${SWIFT_LIB_NAME}_maccatalyst.a"

	# === Build the bundle ===

	xcodebuild -create-xcframework \
		-output "./ProseCore/Artifacts/${XCFRAMEWORK_NAME}.xcframework" \
		-library "${BUILD_FOLDER}/lib${SWIFT_LIB_NAME}_macos.a" \
		-headers "${BUILD_FOLDER}/interface/"
	# For future platforms:
	# Note: Make sure commented lines are after the command
	# -library "${BUILD_FOLDER}/lib${SWIFT_LIB_NAME}_iossimulator.a"
	# -headers "${BUILD_FOLDER}/interface/"
	# -library "${BUILD_FOLDER}/lib${SWIFT_LIB_NAME}_maccatalyst.a"
	# -headers "${BUILD_FOLDER}/interface/"
	# -library "${RUST_LIB_PATH}/target/aarch64-apple-ios/release/lib${SWIFT_LIB_NAME}.a"
	# -headers "${BUILD_FOLDER}/interface/"
