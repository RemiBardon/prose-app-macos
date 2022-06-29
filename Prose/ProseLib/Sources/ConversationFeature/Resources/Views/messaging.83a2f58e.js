!function(e,t,n,r,s){var i="undefined"!=typeof globalThis?globalThis:"undefined"!=typeof self?self:"undefined"!=typeof window?window:"undefined"!=typeof global?global:{},o="function"==typeof i.parcelRequire5c93&&i.parcelRequire5c93,l=o.cache||{},a="undefined"!=typeof module&&"function"==typeof module.require&&module.require.bind(module);function c(t,n){if(!l[t]){if(!e[t]){var r="function"==typeof i.parcelRequire5c93&&i.parcelRequire5c93;if(!n&&r)return r(t,!0);if(o)return o(t,!0);if(a&&"string"==typeof t)return a(t);var s=new Error("Cannot find module '"+t+"'");throw s.code="MODULE_NOT_FOUND",s}f.resolve=function(n){var r=e[t][1][n];return null!=r?r:n},f.cache={};var u=l[t]=new c.Module(t);e[t][0].call(u.exports,f,u,u.exports,this)}return l[t].exports;function f(e){var t=f.resolve(e);return!1===t?{}:c(t)}}c.isParcelRequire=!0,c.Module=function(e){this.id=e,this.bundle=c,this.exports={}},c.modules=e,c.cache=l,c.parent=o,c.register=function(t,n){e[t]=[function(e,t){t.exports=n},{}]},Object.defineProperty(c,"root",{get:function(){return i.parcelRequire5c93}}),i.parcelRequire5c93=c;for(var u=0;u<t.length;u++)c(t[u]);var f=c(n);"object"==typeof exports&&"undefined"!=typeof module?module.exports=f:"function"==typeof define&&define.amd&&define((function(){return f}))}({"3rmH8":[function(e,t,n){var r=e("@parcel/transformer-js/src/esmodule-helpers.js"),s=e("petite-vue"),i=e("./stores/option.js"),o=r.interopDefault(i),l=e("./stores/feed.js"),a=r.interopDefault(l),c=e("./components/avatar/avatar.js"),u=r.interopDefault(c),f=e("./components/separator/separator.js"),p=r.interopDefault(f),d=e("./components/entry/entry.js"),h=r.interopDefault(d),m=e("./components/message/message.js");const g=(0,o.default)(),y=(0,a.default)();(0,s.createApp)({App:function(){return{isReady:!1,mounted(){this.isReady=!0}}},Avatar:u.default,Separator:p.default,Entry:h.default,Message:m.Message,MessageLineText:m.MessageLineText,MessageLineFile:m.MessageLineFile,$store:y,$context:g}).mount("#app"),globalThis.MessagingContext=g,globalThis.MessagingStore=y},{"petite-vue":"jIAbH","./stores/option.js":"5BWAm","./stores/feed.js":"28o58","./components/avatar/avatar.js":"fJYXK","./components/separator/separator.js":"1bnRg","./components/entry/entry.js":"luo1X","./components/message/message.js":"blaZ9","@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],jIAbH:[function(e,t,n){var r=e("@parcel/transformer-js/src/esmodule-helpers.js");r.defineInteropFlag(n),r.export(n,"createApp",(()=>at)),r.export(n,"nextTick",(()=>ye)),r.export(n,"reactive",(()=>ue));var s=Object.defineProperty,i=(e,t,n)=>(((e,t,n)=>{t in e?s(e,t,{enumerable:!0,configurable:!0,writable:!0,value:n}):e[t]=n})(e,"symbol"!=typeof t?t+"":t,n),n);function o(e){if(g(e)){const t={};for(let n=0;n<e.length;n++){const r=e[n],s=b(r)?c(r):o(r);if(s)for(const e in s)t[e]=s[e]}return t}return b(e)||j(e)?e:void 0}const l=/;(?![^(]*\))/g,a=/:(.+)/;function c(e){const t={};return e.split(l).forEach((e=>{if(e){const n=e.split(a);n.length>1&&(t[n[0].trim()]=n[1].trim())}})),t}function u(e){let t="";if(b(e))t=e;else if(g(e))for(let n=0;n<e.length;n++){const r=u(e[n]);r&&(t+=r+" ")}else if(j(e))for(const n in e)e[n]&&(t+=n+" ");return t.trim()}function f(e,t){if(e===t)return!0;let n=v(e),r=v(t);if(n||r)return!(!n||!r)&&e.getTime()===t.getTime();if(n=g(e),r=g(t),n||r)return!(!n||!r)&&function(e,t){if(e.length!==t.length)return!1;let n=!0;for(let r=0;n&&r<e.length;r++)n=f(e[r],t[r]);return n}(e,t);if(n=j(e),r=j(t),n||r){if(!n||!r)return!1;if(Object.keys(e).length!==Object.keys(t).length)return!1;for(const n in e){const r=e.hasOwnProperty(n),s=t.hasOwnProperty(n);if(r&&!s||!r&&s||!f(e[n],t[n]))return!1}}return String(e)===String(t)}function p(e,t){return e.findIndex((e=>f(e,t)))}const d=Object.assign,h=Object.prototype.hasOwnProperty,m=(e,t)=>h.call(e,t),g=Array.isArray,y=e=>"[object Map]"===x(e),v=e=>e instanceof Date,b=e=>"string"==typeof e,_=e=>"symbol"==typeof e,j=e=>null!==e&&"object"==typeof e,w=Object.prototype.toString,x=e=>w.call(e),E=e=>b(e)&&"NaN"!==e&&"-"!==e[0]&&""+parseInt(e,10)===e,S=e=>{const t=Object.create(null);return n=>t[n]||(t[n]=e(n))},A=/-(\w)/g,I=S((e=>e.replace(A,((e,t)=>t?t.toUpperCase():"")))),M=/\B([A-Z])/g,T=S((e=>e.replace(M,"-$1").toLowerCase())),R=e=>{const t=parseFloat(e);return isNaN(t)?e:t};function $(e,t){(t=t||undefined)&&t.active&&t.effects.push(e)}const O=e=>{const t=new Set(e);return t.w=0,t.n=0,t},k=e=>(e.w&F)>0,P=e=>(e.n&F)>0,L=new WeakMap;let D=0,F=1;const N=[];let z;const C=Symbol(""),Y=Symbol("");class K{run(){if(!this.active)return this.fn();if(!N.includes(this))try{return N.push(z=this),H.push(U),U=!0,F=1<<++D,D<=30?(({deps:e})=>{if(e.length)for(let t=0;t<e.length;t++)e[t].w|=F})(this):B(this),this.fn()}finally{D<=30&&(e=>{const{deps:t}=e;if(t.length){let n=0;for(let r=0;r<t.length;r++){const s=t[r];k(s)&&!P(s)?s.delete(e):t[n++]=s,s.w&=~F,s.n&=~F}t.length=n}})(this),F=1<<--D,W(),N.pop();const e=N.length;z=e>0?N[e-1]:void 0}}stop(){this.active&&(B(this),this.onStop&&this.onStop(),this.active=!1)}constructor(e,t=null,n){this.fn=e,this.scheduler=t,this.active=!0,this.deps=[],$(this,n)}}function B(e){const{deps:t}=e;if(t.length){for(let n=0;n<t.length;n++)t[n].delete(e);t.length=0}}function q(e){e.effect.stop()}let U=!0;const H=[];function W(){const e=H.pop();U=void 0===e||e}function J(e,t,n){if(!U||void 0===z)return;let r=L.get(e);r||L.set(e,r=new Map);let s=r.get(n);s||r.set(n,s=O()),function(e,t){let n=!1;D<=30?P(e)||(e.n|=F,n=!k(e)):n=!e.has(z),n&&(e.add(z),z.deps.push(e))}(s)}function V(e,t,n,r,s,i){const o=L.get(e);if(!o)return;let l=[];if("clear"===t)l=[...o.values()];else if("length"===n&&g(e))o.forEach(((e,t)=>{("length"===t||t>=r)&&l.push(e)}));else switch(void 0!==n&&l.push(o.get(n)),t){case"add":g(e)?E(n)&&l.push(o.get("length")):(l.push(o.get(C)),y(e)&&l.push(o.get(Y)));break;case"delete":g(e)||(l.push(o.get(C)),y(e)&&l.push(o.get(Y)));break;case"set":y(e)&&l.push(o.get(C))}if(1===l.length)l[0]&&G(l[0]);else{const e=[];for(const t of l)t&&e.push(...t);G(O(e))}}function G(e,t){for(const t of g(e)?e:[...e])(t!==z||t.allowRecurse)&&(t.scheduler?t.scheduler():t.run())}const Z=function(e,t){const n=Object.create(null),r=e.split(",");for(let e=0;e<r.length;e++)n[r[e]]=!0;return t?e=>!!n[e.toLowerCase()]:e=>!!n[e]}("__proto__,__v_isRef,__isVue"),X=new Set(Object.getOwnPropertyNames(Symbol).map((e=>Symbol[e])).filter(_)),Q=ne(),ee=ne(!0),te=function(){const e={};return["includes","indexOf","lastIndexOf"].forEach((t=>{e[t]=function(...e){const n=pe(this);for(let e=0,t=this.length;e<t;e++)J(n,0,e+"");const r=n[t](...e);return-1===r||!1===r?n[t](...e.map(pe)):r}})),["push","pop","shift","unshift","splice"].forEach((t=>{e[t]=function(...e){H.push(U),U=!1;const n=pe(this)[t].apply(this,e);return W(),n}})),e}();function ne(e=!1,t=!1){return function(n,r,s){if("__v_isReactive"===r)return!e;if("__v_isReadonly"===r)return e;if("__v_raw"===r&&s===(e?t?ae:le:t?oe:ie).get(n))return n;const i=g(n);if(!e&&i&&m(te,r))return Reflect.get(te,r,s);const o=Reflect.get(n,r,s);return(_(r)?X.has(r):Z(r))||(e||J(n,0,r),t)?o:de(o)?i&&E(r)?o:o.value:j(o)?e?function(e){return fe(e,!0,se,null,le)}(o):ue(o):o}}const re={get:Q,set:function(e=!1){return function(t,n,r,s){let i=t[n];if(!e&&!function(e){return!(!e||!e.__v_isReadonly)}(r)&&(r=pe(r),i=pe(i),!g(t)&&de(i)&&!de(r)))return i.value=r,!0;const o=g(t)&&E(n)?Number(n)<t.length:m(t,n),l=Reflect.set(t,n,r,s);return t===pe(s)&&(o?((e,t)=>!Object.is(e,t))(r,i)&&V(t,"set",n,r):V(t,"add",n,r)),l}}(),deleteProperty:function(e,t){const n=m(e,t);e[t];const r=Reflect.deleteProperty(e,t);return r&&n&&V(e,"delete",t,void 0),r},has:function(e,t){const n=Reflect.has(e,t);return(!_(t)||!X.has(t))&&J(e,0,t),n},ownKeys:function(e){return J(e,0,g(e)?"length":C),Reflect.ownKeys(e)}},se={get:ee,set:(e,t)=>!0,deleteProperty:(e,t)=>!0},ie=new WeakMap,oe=new WeakMap,le=new WeakMap,ae=new WeakMap;function ce(e){return e.__v_skip||!Object.isExtensible(e)?0:function(e){switch(e){case"Object":case"Array":return 1;case"Map":case"Set":case"WeakMap":case"WeakSet":return 2;default:return 0}}((e=>x(e).slice(8,-1))(e))}function ue(e){return e&&e.__v_isReadonly?e:fe(e,!1,re,null,ie)}function fe(e,t,n,r,s){if(!j(e)||e.__v_raw&&(!t||!e.__v_isReactive))return e;const i=s.get(e);if(i)return i;const o=ce(e);if(0===o)return e;const l=new Proxy(e,2===o?r:n);return s.set(e,l),l}function pe(e){const t=e&&e.__v_raw;return t?pe(t):e}function de(e){return Boolean(e&&!0===e.__v_isRef)}Promise.resolve();let he=!1;const me=[],ge=Promise.resolve(),ye=e=>ge.then(e),ve=e=>{me.includes(e)||me.push(e),he||(he=!0,ye(be))},be=()=>{for(const e of me)e();me.length=0,he=!1},_e=/^(spellcheck|draggable|form|list|type)$/,je=({el:e,get:t,effect:n,arg:r,modifiers:s})=>{let i;"class"===r&&(e._class=e.className),n((()=>{let n=t();if(r)(null==s?void 0:s.camel)&&(r=I(r)),we(e,r,n,i);else{for(const t in n)we(e,t,n[t],i&&i[t]);for(const t in i)(!n||!(t in n))&&we(e,t,null)}i=n}))},we=(e,t,n,r)=>{if("class"===t)e.setAttribute("class",u(e._class?[e._class,n]:n)||"");else if("style"===t){n=o(n);const{style:t}=e;if(n)if(b(n))n!==r&&(t.cssText=n);else{for(const e in n)Ee(t,e,n[e]);if(r&&!b(r))for(const e in r)null==n[e]&&Ee(t,e,"")}else e.removeAttribute("style")}else e instanceof SVGElement||!(t in e)||_e.test(t)?"true-value"===t?e._trueValue=n:"false-value"===t?e._falseValue=n:null!=n?e.setAttribute(t,n):e.removeAttribute(t):(e[t]=n,"value"===t&&(e._value=n))},xe=/\s*!important$/,Ee=(e,t,n)=>{g(n)?n.forEach((n=>Ee(e,t,n))):t.startsWith("--")?e.setProperty(t,n):xe.test(n)?e.setProperty(T(t),n.replace(xe,""),"important"):e[t]=n},Se=(e,t)=>{const n=e.getAttribute(t);return null!=n&&e.removeAttribute(t),n},Ae=(e,t,n,r)=>{e.addEventListener(t,n,r)},Ie=/^[A-Za-z_$][\w$]*(?:\.[A-Za-z_$][\w$]*|\['[^']*?']|\["[^"]*?"]|\[\d+]|\[[A-Za-z_$][\w$]*])*$/,Me=["ctrl","shift","alt","meta"],Te={stop:e=>e.stopPropagation(),prevent:e=>e.preventDefault(),self:e=>e.target!==e.currentTarget,ctrl:e=>!e.ctrlKey,shift:e=>!e.shiftKey,alt:e=>!e.altKey,meta:e=>!e.metaKey,left:e=>"button"in e&&0!==e.button,middle:e=>"button"in e&&1!==e.button,right:e=>"button"in e&&2!==e.button,exact:(e,t)=>Me.some((n=>e[`${n}Key`]&&!t[n]))},Re=({el:e,get:t,exp:n,arg:r,modifiers:s})=>{if(!r)return;let i=Ie.test(n)?t(`(e => ${n}(e))`):t(`($event => { ${n} })`);if("vue:mounted"!==r){if("vue:unmounted"===r)return()=>i();if(s){"click"===r&&(s.right&&(r="contextmenu"),s.middle&&(r="mouseup"));const e=i;i=t=>{if(!("key"in t)||T(t.key)in s){for(const e in s){const n=Te[e];if(n&&n(t,s))return}return e(t)}}}Ae(e,r,i,s)}else ye(i)},$e=({el:e,get:t,effect:n})=>{n((()=>{e.textContent=Oe(t())}))},Oe=e=>null==e?"":j(e)?JSON.stringify(e,null,2):String(e),ke=e=>"_value"in e?e._value:e.value,Pe=(e,t)=>{const n=t?"_trueValue":"_falseValue";return n in e?e[n]:t},Le=e=>{e.target.composing=!0},De=e=>{const t=e.target;t.composing&&(t.composing=!1,Fe(t,"input"))},Fe=(e,t)=>{const n=document.createEvent("HTMLEvents");n.initEvent(t,!0,!0),e.dispatchEvent(n)},Ne=Object.create(null),ze=(e,t,n)=>Ce(e,`return(${t})`,n),Ce=(e,t,n)=>{const r=Ne[t]||(Ne[t]=Ye(t));try{return r(e,n)}catch(e){console.error(e)}},Ye=e=>{try{return new Function("$data","$el",`with($data){${e}}`)}catch(t){return console.error(`${t.message} in expression: ${e}`),()=>{}}},Ke={bind:je,on:Re,show:({el:e,get:t,effect:n})=>{const r=e.style.display;n((()=>{e.style.display=t()?r:"none"}))},text:$e,html:({el:e,get:t,effect:n})=>{n((()=>{e.innerHTML=t()}))},model:({el:e,exp:t,get:n,effect:r,modifiers:s})=>{const i=e.type,o=n(`(val) => { ${t} = val }`),{trim:l,number:a="number"===i}=s||{};if("SELECT"===e.tagName){const t=e;Ae(e,"change",(()=>{const e=Array.prototype.filter.call(t.options,(e=>e.selected)).map((e=>a?R(ke(e)):ke(e)));o(t.multiple?e:e[0])})),r((()=>{const e=n(),r=t.multiple;for(let n=0,s=t.options.length;n<s;n++){const s=t.options[n],i=ke(s);if(r)g(e)?s.selected=p(e,i)>-1:s.selected=e.has(i);else if(f(ke(s),e))return void(t.selectedIndex!==n&&(t.selectedIndex=n))}!r&&-1!==t.selectedIndex&&(t.selectedIndex=-1)}))}else if("checkbox"===i){let t;Ae(e,"change",(()=>{const t=n(),r=e.checked;if(g(t)){const n=ke(e),s=p(t,n),i=-1!==s;if(r&&!i)o(t.concat(n));else if(!r&&i){const e=[...t];e.splice(s,1),o(e)}}else o(Pe(e,r))})),r((()=>{const r=n();g(r)?e.checked=p(r,ke(e))>-1:r!==t&&(e.checked=f(r,Pe(e,!0))),t=r}))}else if("radio"===i){let t;Ae(e,"change",(()=>{o(ke(e))})),r((()=>{const r=n();r!==t&&(e.checked=f(r,ke(e)))}))}else{const t=e=>l?e.trim():a?R(e):e;Ae(e,"compositionstart",Le),Ae(e,"compositionend",De),Ae(e,(null==s?void 0:s.lazy)?"change":"input",(()=>{e.composing||o(t(e.value))})),l&&Ae(e,"change",(()=>{e.value=e.value.trim()})),r((()=>{if(e.composing)return;const r=e.value,s=n();document.activeElement===e&&t(r)===s||r!==s&&(e.value=s)}))}},effect:({el:e,ctx:t,exp:n,effect:r})=>{ye((()=>r((()=>Ce(t.scope,n,e)))))}},Be=/([\s\S]*?)\s+(?:in|of)\s+([\s\S]*)/,qe=/,([^,\}\]]*)(?:,([^,\}\]]*))?$/,Ue=/^\(|\)$/g,He=/^[{[]\s*((?:[\w_$]+\s*,?\s*)+)[\]}]$/,We=(e,t,n)=>{const r=t.match(Be);if(!r)return;const s=e.nextSibling,i=e.parentElement,o=new Text("");i.insertBefore(o,e),i.removeChild(e);const l=r[2].trim();let a,c,u,f,p=r[1].trim().replace(Ue,"").trim(),d=!1,h="key",m=e.getAttribute(h)||e.getAttribute(h=":key")||e.getAttribute(h="v-bind:key");m&&(e.removeAttribute(h),"key"===h&&(m=JSON.stringify(m))),(f=p.match(qe))&&(p=p.replace(qe,"").trim(),c=f[1].trim(),f[2]&&(u=f[2].trim())),(f=p.match(He))&&(a=f[1].split(",").map((e=>e.trim())),d="["===p[0]);let y,v,b,_=!1;const w=(e,t,r,s)=>{const i={};a?a.forEach(((e,n)=>i[e]=t[d?n:e])):i[p]=t,s?(c&&(i[c]=s),u&&(i[u]=r)):c&&(i[c]=r);const o=st(n,i),l=m?ze(o.scope,m):r;return e.set(l,r),o.key=l,o},x=(t,n)=>{const r=new ot(e,t);return r.key=t.key,r.insert(i,n),r};return n.effect((()=>{const e=ze(n.scope,l),t=b;if([v,b]=(e=>{const t=new Map,n=[];if(g(e))for(let r=0;r<e.length;r++)n.push(w(t,e[r],r));else if("number"==typeof e)for(let r=0;r<e;r++)n.push(w(t,r+1,r));else if(j(e)){let r=0;for(const s in e)n.push(w(t,e[s],r++,s))}return[n,t]})(e),_){for(let e=0;e<y.length;e++)b.has(y[e].key)||y[e].remove();const e=[];let n,r,s=v.length;for(;s--;){const l=v[s],a=t.get(l.key);let c;null==a?c=x(l,n?n.el:o):(c=y[a],Object.assign(c.ctx.scope,l.scope),a!==s&&(y[a+1]!==n||r===n)&&(r=c,c.insert(i,n?n.el:o))),e.unshift(n=c)}y=e}else y=v.map((e=>x(e,o))),_=!0})),s},Je=({el:e,ctx:{scope:{$refs:t}},get:n,effect:r})=>{let s;return r((()=>{const r=n();t[r]=e,s&&r!==s&&delete t[s],s=r})),()=>{s&&delete t[s]}},Ve=/^(?:v-|:|@)/,Ge=/\.([\w-]+)/g;let Ze=!1;const Xe=(e,t)=>{const n=e.nodeType;if(1===n){const n=e;if(n.hasAttribute("v-pre"))return;let r;if(Se(n,"v-cloak"),r=Se(n,"v-if"))return((e,t,n)=>{const r=e.parentElement,s=new Comment("v-if");r.insertBefore(s,e);const i=[{exp:t,el:e}];let o,l;for(;(o=e.nextElementSibling)&&(l=null,""===Se(o,"v-else")||(l=Se(o,"v-else-if")));)r.removeChild(o),i.push({exp:l,el:o});const a=e.nextSibling;r.removeChild(e);let c,u=-1;const f=()=>{c&&(r.insertBefore(s,c.el),c.remove(),c=void 0)};return n.effect((()=>{for(let e=0;e<i.length;e++){const{exp:t,el:o}=i[e];if(!t||ze(n.scope,t))return void(e!==u&&(f(),c=new ot(o,n),c.insert(r,s),r.removeChild(s),u=e))}u=-1,f()})),a})(n,r,t);if(r=Se(n,"v-for"))return We(n,r,t);if((r=Se(n,"v-scope"))||""===r){const e=r?ze(t.scope,r):{};t=st(t,e),e.$template&&nt(n,e.$template)}const s=null!=Se(n,"v-once");s&&(Ze=!0),(r=Se(n,"ref"))&&tt(n,Je,`"${r}"`,t),Qe(n,t);const i=[];for(const{name:e,value:r}of[...n.attributes])Ve.test(e)&&"v-cloak"!==e&&("v-model"===e?i.unshift([e,r]):"@"===e[0]||/^v-on\b/.test(e)?i.push([e,r]):et(n,e,r,t));for(const[e,r]of i)et(n,e,r,t);s&&(Ze=!1)}else if(3===n){const n=e.data;if(n.includes(t.delimiters[0])){let r,s=[],i=0;for(;r=t.delimitersRE.exec(n);){const e=n.slice(i,r.index);e&&s.push(JSON.stringify(e)),s.push(`$s(${r[1]})`),i=r.index+r[0].length}i<n.length&&s.push(JSON.stringify(n.slice(i))),tt(e,$e,s.join("+"),t)}}else 11===n&&Qe(e,t)},Qe=(e,t)=>{let n=e.firstChild;for(;n;)n=Xe(n,t)||n.nextSibling},et=(e,t,n,r)=>{let s,i,o;if(":"===(t=t.replace(Ge,((e,t)=>((o||(o={}))[t]=!0,""))))[0])s=je,i=t.slice(1);else if("@"===t[0])s=Re,i=t.slice(1);else{const e=t.indexOf(":"),n=e>0?t.slice(2,e):t.slice(2);s=Ke[n]||r.dirs[n],i=e>0?t.slice(e+1):void 0}s&&(s===je&&"ref"===i&&(s=Je),tt(e,s,n,r,i,o),e.removeAttribute(t))},tt=(e,t,n,r,s,i)=>{const o=t({el:e,get:(t=n)=>ze(r.scope,t,e),effect:r.effect,ctx:r,exp:n,arg:s,modifiers:i});o&&r.cleanups.push(o)},nt=(e,t)=>{if("#"!==t[0])e.innerHTML=t;else{const n=document.querySelector(t);e.appendChild(n.content.cloneNode(!0))}},rt=e=>{const t={delimiters:["{{","}}"],delimitersRE:/\{\{([^]+?)\}\}/g,...e,scope:e?e.scope:ue({}),dirs:e?e.dirs:{},effects:[],blocks:[],cleanups:[],effect:e=>{if(Ze)return ve(e),e;const n=function(e,t){e.effect&&(e=e.effect.fn);const n=new K(e);t&&(d(n,t),t.scope&&$(n,t.scope)),(!t||!t.lazy)&&n.run();const r=n.run.bind(n);return r.effect=n,r}(e,{scheduler:()=>ve(n)});return t.effects.push(n),n}};return t},st=(e,t={})=>{const n=e.scope,r=Object.create(n);Object.defineProperties(r,Object.getOwnPropertyDescriptors(t)),r.$refs=Object.create(n.$refs);const s=ue(new Proxy(r,{set:(e,t,r,i)=>i!==s||e.hasOwnProperty(t)?Reflect.set(e,t,r,i):Reflect.set(n,t,r)}));return it(s),{...e,scope:s}},it=e=>{for(const t of Object.keys(e))"function"==typeof e[t]&&(e[t]=e[t].bind(e))};class ot{get el(){return this.start||this.template}insert(e,t=null){if(this.isFragment)if(this.start){let n,r=this.start;for(;r&&(n=r.nextSibling,e.insertBefore(r,t),r!==this.end);)r=n}else this.start=new Text(""),this.end=new Text(""),e.insertBefore(this.end,t),e.insertBefore(this.start,this.end),e.insertBefore(this.template,this.end);else e.insertBefore(this.template,t)}remove(){if(this.parentCtx&&((e,t)=>{const n=e.indexOf(t);n>-1&&e.splice(n,1)})(this.parentCtx.blocks,this),this.start){const e=this.start.parentNode;let t,n=this.start;for(;n&&(t=n.nextSibling,e.removeChild(n),n!==this.end);)n=t}else this.template.parentNode.removeChild(this.template);this.teardown()}teardown(){this.ctx.blocks.forEach((e=>{e.teardown()})),this.ctx.effects.forEach(q),this.ctx.cleanups.forEach((e=>e()))}constructor(e,t,n=!1){i(this,"template"),i(this,"ctx"),i(this,"key"),i(this,"parentCtx"),i(this,"isFragment"),i(this,"start"),i(this,"end"),this.isFragment=e instanceof HTMLTemplateElement,n?this.template=e:this.isFragment?this.template=e.content.cloneNode(!0):this.template=e.cloneNode(!0),n?this.ctx=t:(this.parentCtx=t,t.blocks.push(this),this.ctx=rt(t)),Xe(this.template,this.ctx)}}const lt=e=>e.replace(/[-.*+?^${}()|[\]\/\\]/g,"\\$&"),at=e=>{const t=rt();if(e&&(t.scope=ue(e),it(t.scope),e.$delimiters)){const[n,r]=t.delimiters=e.$delimiters;t.delimitersRE=new RegExp(lt(n)+"([^]+?)"+lt(r),"g")}let n;return t.scope.$s=Oe,t.scope.$nextTick=ye,t.scope.$refs=Object.create(null),{directive(e,n){return n?(t.dirs[e]=n,this):t.dirs[e]},mount(e){if("string"==typeof e&&!(e=document.querySelector(e)))return;let r;return r=(e=e||document.documentElement).hasAttribute("v-scope")?[e]:[...e.querySelectorAll("[v-scope]")].filter((e=>!e.matches("[v-scope] [v-scope]"))),r.length||(r=[e]),n=r.map((e=>new ot(e,t,!0))),this},unmount(){n.forEach((e=>e.teardown()))}}},ct=document.currentScript;ct&&ct.hasAttribute("init")&&at().mount()},{"@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],"4zLtK":[function(e,t,n){n.interopDefault=function(e){return e&&e.__esModule?e:{default:e}},n.defineInteropFlag=function(e){Object.defineProperty(e,"__esModule",{value:!0})},n.exportAll=function(e,t){return Object.keys(e).forEach((function(n){"default"===n||"__esModule"===n||t.hasOwnProperty(n)||Object.defineProperty(t,n,{enumerable:!0,get:function(){return e[n]}})})),t},n.export=function(e,t,n){Object.defineProperty(e,t,{enumerable:!0,get:n})}},{}],"5BWAm":[function(e,t,n){var r=e("@parcel/transformer-js/src/esmodule-helpers.js");r.defineInteropFlag(n);var s=e("petite-vue"),i=e("../helpers/toolbox.js"),o=r.interopDefault(i);const l=["light","dark"];n.default=function(){return{style:(0,s.reactive)({theme:o.default.detectAppearancePreference()}),getStyleTheme(){return this.style.theme},setStyleTheme(e){if(!e||!1===l.includes(e))throw new Error(`Style theme invalid, allowed values: ${l.join(", ")}`);this.style.theme=e}}}},{"petite-vue":"jIAbH","../helpers/toolbox.js":"alWcq","@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],alWcq:[function(e,t,n){e("@parcel/transformer-js/src/esmodule-helpers.js").defineInteropFlag(n);const r={detectAppearancePreference:function(){let e;try{if("function"==typeof window.matchMedia&&!0===window.matchMedia("(prefers-color-scheme: dark)").matches)return void(e="dark")}catch(e){}finally{return e||"light"}}};n.default=r},{"@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],"28o58":[function(e,t,n){var r=e("@parcel/transformer-js/src/esmodule-helpers.js");r.defineInteropFlag(n);var s=e("petite-vue"),i=e("nanoid"),o=e("../helpers/date.js"),l=r.interopDefault(o),a=e("../helpers/message.js"),c=r.interopDefault(a);n.default=function(){return{feed:(0,s.reactive)({entries:[]}),__registers:{feedEntriesById:{},entryIdForLineId:{}},exists(e){return void 0!==this.__registers.entryIdForLineId[e]},resolve(e){let t=this.__registers.entryIdForLineId[e]||null;if(null!==t){let n=this.__registers.feedEntriesById[t]||null;if(null!==n){let t=n.content.find((t=>t.id===e));if(t)return{...t}}}return null},insert(...e){return e.forEach((e=>{if(!(e.id&&e.type&&e.date&&e.content&&e.from&&e.from.jid))throw new Error("Message to insert is incomplete (missing attribute)");if(!0===this.exists(e.id))throw new Error("Message with this identifier has already been inserted");let t=c.default.transformIntoModel(e.type,e);t.id=(0,i.nanoid)(),t.insertedAt=Date.now(),t.updatedAt=0;let n=this.feed.entries[this.feed.entries.length-1];if(!n||!l.default.areSameDay(n.date,t.date)){let e=c.default.makeSeparatorModel(t);e.id=(0,i.nanoid)(),this.__registers.feedEntriesById[e.id]=e,this.feed.entries.push(e),n=e}n&&n.type===c.default.ENTRY_TYPE_MESSAGE&&n.user.jid===t.user.jid&&l.default.areWithinElapsedTime(n.date,t.date,6e5)?(t.content.forEach((e=>{n.content.push(e)})),t=n,t.updatedAt=Date.now()):(this.__registers.feedEntriesById[t.id]=t,this.feed.entries.push(t)),this.__registers.entryIdForLineId[e.id]=t.id})),e.length>0},update(e,t){if(!t.type||!t.content)throw new Error("Message to update is incomplete (missing attribute)");let n=this.__resolveEntry(e);if(null!==n){if(n.type!==c.default.ENTRY_TYPE_MESSAGE)throw new Error(`Only entries of '${c.default.ENTRY_TYPE_MESSAGE}' type can be updated (got '${n.type}')`);t.id=e;let r=c.default.transformIntoModel(t.type,t);return r.content.forEach((e=>{n.content.forEach((t=>{t.id===e.id&&Object.assign(t,e)}))})),r.user&&Object.assign(n.user,r.user),n.updatedAt=Date.now(),!0}return!1},retract(e){let t=!1,n=this.__resolveEntry(e);if(null!==n){delete this.__registers.entryIdForLineId[e];let r=n.content.findIndex((t=>t.id===e));if(-1!==r&&(n.content.splice(r,1),t=!0),0===n.content.length){delete this.__registers.feedEntriesById[n.id];let e=this.feed.entries.findIndex((e=>e.id===n.id));if(-1!==e){let t=this.feed.entries[e-1],n=this.feed.entries[e+1];this.feed.entries.splice(e,1),!t||t.type!==c.default.ENTRY_TYPE_SEPARATOR||n&&n.type!==c.default.ENTRY_TYPE_SEPARATOR||(delete this.__registers.feedEntriesById[t.id],this.feed.entries.splice(e-1,1))}}else n.updatedAt=Date.now()}return t},flush(){return this.feed.entries.length>0&&(this.feed.entries=[],this.__registers.feedEntriesById={},this.__registers.entryIdForLineId={},!0)},__resolveEntry(e){let t=this.__registers.entryIdForLineId[e]||null;return null!==t&&this.__registers.feedEntriesById[t]||null}}}},{"petite-vue":"jIAbH",nanoid:"7SJGU","../helpers/date.js":"3eYeV","../helpers/message.js":"fKAP2","@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],"7SJGU":[function(e,t,n){var r=e("@parcel/transformer-js/src/esmodule-helpers.js");r.defineInteropFlag(n),r.export(n,"urlAlphabet",(()=>s.urlAlphabet)),r.export(n,"random",(()=>i)),r.export(n,"customRandom",(()=>o)),r.export(n,"customAlphabet",(()=>l)),r.export(n,"nanoid",(()=>a));var s=e("./url-alphabet/index.js");let i=e=>crypto.getRandomValues(new Uint8Array(e)),o=(e,t,n)=>{let r=(2<<Math.log(e.length-1)/Math.LN2)-1,s=-~(1.6*r*t/e.length);return(i=t)=>{let o="";for(;;){let t=n(s),l=s;for(;l--;)if(o+=e[t[l]&r]||"",o.length===i)return o}}},l=(e,t=21)=>o(e,t,i),a=(e=21)=>crypto.getRandomValues(new Uint8Array(e)).reduce(((e,t)=>e+=(t&=63)<36?t.toString(36):t<62?(t-26).toString(36).toUpperCase():t>62?"-":"_"),"")},{"./url-alphabet/index.js":!1,"@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],"3eYeV":[function(e,t,n){e("@parcel/transformer-js/src/esmodule-helpers.js").defineInteropFlag(n);n.default={areSameYear:function(e,t){return e.getFullYear()===t.getFullYear()},areSameMonth:function(e,t){return this.areSameYear(e,t)&&e.getMonth()===t.getMonth()},areSameDay:function(e,t){return this.areSameMonth(e,t)&&e.getDate()===t.getDate()},formatDateString:function(e){return e.toLocaleDateString()},areWithinElapsedTime:function(e,t,n=0){let r=t.getTime()-e.getTime();return r>=0&&r<n}}},{"@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],fKAP2:[function(e,t,n){var r=e("@parcel/transformer-js/src/esmodule-helpers.js");r.defineInteropFlag(n);var s=e("petite-vue"),i=e("./date.js"),o=r.interopDefault(i);const l={ENTRY_TYPE_SEPARATOR:"separator",ENTRY_TYPE_MESSAGE:"message",transformIntoModel:function(e,t){let n={type:this.ENTRY_TYPE_MESSAGE};if(t.from){if(!t.from.jid)throw new Error("Message model JID is not set on user (required if 'from' is set)");n.user=t.from}if(t.date){let e=new Date(t.date);if(!0===isNaN(e))throw new Error("Message model date is invalid (cannot parse)");n.date=e}if(t.content&&t.id){let r={id:t.id};switch(e){case"text":if("string"!=typeof t.content)throw new Error("Message content is invalid for type ('text' should be 'string')");r.type="text",r.text=t.content;break;case"file":if(!t.content.type&&!t.content.url)throw new Error("Message content is incomplete for type ('file' should have 'type' and 'url')");r.type="file",r.file=t.content;break;default:throw new Error("Message model type is not recognized (cannot assign content)")}n.content=[r]}return this.__finalize(n)},makeSeparatorModel:function(e){return this.__finalize({type:this.ENTRY_TYPE_SEPARATOR,date:new Date(e.date),label:o.default.formatDateString(e.date)})},__finalize:function(e){return(0,s.reactive)(e)}};n.default=l},{"petite-vue":"jIAbH","./date.js":"3eYeV","@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],fJYXK:[function(e,t,n){e("@parcel/transformer-js/src/esmodule-helpers.js").defineInteropFlag(n);const r=["df74c9","05cd8f","52a6db","ee733d","f48686","6b6f8c","e13030","8e30de","b258ec","f15e5e","3159ea","7ab0ff","78c670","18aeec","8125d4","c32ea3","415dae","d79b25","ce811a","2ba032"];n.default=function(e){return{avatarUrl:e.avatar||null,defaultInitials:null,defaultPalette:null,mounted(){null===this.avatarUrl&&(this.defaultInitials=this.generateDefaultInitials(e.jid,e.name),this.defaultPalette=this.generateDefaultPalette(e.jid))},generateDefaultInitials(e,t=""){if(t){let e=t.split(" ").map((e=>e.trim())).filter((e=>!!e));if(e.length>=2)return`${e[0][0]}${e[1][0]}`.toUpperCase();if(e[0].length>=2)return e[0].substring(0,2).toUpperCase()}let n=e.split("@");return n[0]&&n[0].length>=1?n[0].substring(0,2).toUpperCase():null},generateDefaultPalette(e=""){let t=0;for(let n=0;n<e.length;n++)t+=e.charCodeAt(n);return`#${r[t%r.length]}`}}}},{"@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],"1bnRg":[function(e,t,n){e("@parcel/transformer-js/src/esmodule-helpers.js").defineInteropFlag(n),n.default=function(e){return{label:e.label}}},{"@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],luo1X:[function(e,t,n){e("@parcel/transformer-js/src/esmodule-helpers.js").defineInteropFlag(n),n.default=function(e){return{type:e.type,message:"message"===e.type?e:null,separator:"separator"===e.type?e:null}}},{"@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],blaZ9:[function(e,t,n){var r=e("@parcel/transformer-js/src/esmodule-helpers.js");r.defineInteropFlag(n),r.export(n,"Message",(()=>a)),r.export(n,"MessageLineText",(()=>c)),r.export(n,"MessageLineFile",(()=>u));var s=e("escape-goat");const i=/\n/g,o=/\s/g,l={image:new Set(["image/jpeg","image/gif","image/png","image/tiff","image/webp"])};function a(e){return{content:e.content,user:e.user,date:null,mounted(){this.date=this.generateDate(e.date)},generateDate(e){let t=new Date(e);if(!1===isNaN(t.getTime())){return t.toLocaleString("en-US",{hour:"numeric",minute:"numeric",hour12:!0}).toLowerCase().replace(o,"")}return null}}}function c(e){return{$template:"#template-message-line-text",html:null,mounted(){this.html=this.generateHTML(e)},generateHTML:e=>(0,s.htmlEscape)(e.text).replace(i,"<br>")}}function u(e){return{$template:"#template-message-line-file",file:e.file,presentation:null,imageSize:null,isExpanded:!0,mounted(){this.presentation=this.acquireFilePresentation(e),"image"===this.presentation&&(this.imageSize=this.computeFileImageSize(e))},acquireFilePresentation(e){const t=e.file.type;if(t)for(let e in l)if(!0===l[e].has(t))return e;return"other"},computeFileImageSize(e){const t=e.file.size,n=Math.min(t&&t.width?t.width:200,200);return{width:n,height:t&&t.width&&t.height?t.height/t.width*n:null}},onExpanderClick(){this.isExpanded=!this.isExpanded}}}},{"escape-goat":"cPRJI","@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}],cPRJI:[function(e,t,n){var r=e("@parcel/transformer-js/src/esmodule-helpers.js");r.defineInteropFlag(n),r.export(n,"htmlEscape",(()=>o)),r.export(n,"htmlUnescape",(()=>l));const s=e=>e.replace(/&/g,"&amp;").replace(/"/g,"&quot;").replace(/'/g,"&#39;").replace(/</g,"&lt;").replace(/>/g,"&gt;"),i=e=>e.replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&#0?39;/g,"'").replace(/&quot;/g,'"').replace(/&amp;/g,"&");function o(e,...t){if("string"==typeof e)return s(e);let n=e[0];for(const[r,i]of t.entries())n=n+s(String(i))+e[r+1];return n}function l(e,...t){if("string"==typeof e)return i(e);let n=e[0];for(const[r,s]of t.entries())n=n+i(String(s))+e[r+1];return n}},{"@parcel/transformer-js/src/esmodule-helpers.js":"4zLtK"}]},["3rmH8"],"3rmH8");