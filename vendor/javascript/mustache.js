var e=Object.prototype.toString;var t=Array.isArray||function isArrayPolyfill(t){return"[object Array]"===e.call(t)};function isFunction(e){return"function"===typeof e}function typeStr(e){return t(e)?"array":typeof e}function escapeRegExp(e){return e.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&")}function hasProperty(e,t){return null!=e&&"object"===typeof e&&t in e}function primitiveHasOwnProperty(e,t){return null!=e&&"object"!==typeof e&&e.hasOwnProperty&&e.hasOwnProperty(t)}var r=RegExp.prototype.test;function testRegExp(e,t){return r.call(e,t)}var n=/\S/;function isWhitespace(e){return!testRegExp(n,e)}var a={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;","/":"&#x2F;","`":"&#x60;","=":"&#x3D;"};function escapeHtml(e){return String(e).replace(/[&<>"'`=\/]/g,(function fromEntityMap(e){return a[e]}))}var i=/\s*/;var s=/\s+/;var o=/\s*=/;var p=/\s*\}/;var c=/#|\^|\/|>|\{|&|=|!/;function parseTemplate(e,r){if(!e)return[];var n=false;var a=[];var u=[];var h=[];var f=false;var v=false;var g="";var d=0;function stripSpace(){if(f&&!v)while(h.length)delete u[h.pop()];else h=[];f=false;v=false}var y,w,m;function compileTags(e){"string"===typeof e&&(e=e.split(s,2));if(!t(e)||2!==e.length)throw new Error("Invalid tags: "+e);y=new RegExp(escapeRegExp(e[0])+"\\s*");w=new RegExp("\\s*"+escapeRegExp(e[1]));m=new RegExp("\\s*"+escapeRegExp("}"+e[1]))}compileTags(r||l.tags);var C=new Scanner(e);var x,k,T,b,E,S;while(!C.eos()){x=C.pos;T=C.scanUntil(y);if(T)for(var W=0,P=T.length;W<P;++W){b=T.charAt(W);if(isWhitespace(b)){h.push(u.length);g+=b}else{v=true;n=true;g+=" "}u.push(["text",b,x,x+1]);x+=1;if("\n"===b){stripSpace();g="";d=0;n=false}}if(!C.scan(y))break;f=true;k=C.scan(c)||"name";C.scan(i);if("="===k){T=C.scanUntil(o);C.scan(o);C.scanUntil(w)}else if("{"===k){T=C.scanUntil(m);C.scan(p);C.scanUntil(w);k="&"}else T=C.scanUntil(w);if(!C.scan(w))throw new Error("Unclosed tag at "+C.pos);E=">"==k?[k,T,x,C.pos,g,d,n]:[k,T,x,C.pos];d++;u.push(E);if("#"===k||"^"===k)a.push(E);else if("/"===k){S=a.pop();if(!S)throw new Error('Unopened section "'+T+'" at '+x);if(S[1]!==T)throw new Error('Unclosed section "'+S[1]+'" at '+x)}else"name"===k||"{"===k||"&"===k?v=true:"="===k&&compileTags(T)}stripSpace();S=a.pop();if(S)throw new Error('Unclosed section "'+S[1]+'" at '+C.pos);return nestTokens(squashTokens(u))}function squashTokens(e){var t=[];var r,n;for(var a=0,i=e.length;a<i;++a){r=e[a];if(r)if("text"===r[0]&&n&&"text"===n[0]){n[1]+=r[1];n[3]=r[3]}else{t.push(r);n=r}}return t}function nestTokens(e){var t=[];var r=t;var n=[];var a,i;for(var s=0,o=e.length;s<o;++s){a=e[s];switch(a[0]){case"#":case"^":r.push(a);n.push(a);r=a[4]=[];break;case"/":i=n.pop();i[5]=a[2];r=n.length>0?n[n.length-1][4]:t;break;default:r.push(a)}}return t}function Scanner(e){this.string=e;this.tail=e;this.pos=0}Scanner.prototype.eos=function eos(){return""===this.tail};Scanner.prototype.scan=function scan(e){var t=this.tail.match(e);if(!t||0!==t.index)return"";var r=t[0];this.tail=this.tail.substring(r.length);this.pos+=r.length;return r};Scanner.prototype.scanUntil=function scanUntil(e){var t,r=this.tail.search(e);switch(r){case-1:t=this.tail;this.tail="";break;case 0:t="";break;default:t=this.tail.substring(0,r);this.tail=this.tail.substring(r)}this.pos+=t.length;return t};function Context(e,t){this.view=e;this.cache={".":this.view};this.parent=t}Context.prototype.push=function push(e){return new Context(e,this)};Context.prototype.lookup=function lookup(e){var t=this.cache;var r;if(t.hasOwnProperty(e))r=t[e];else{var n,a,i,s=this,o=false;while(s){if(e.indexOf(".")>0){n=s.view;a=e.split(".");i=0;while(null!=n&&i<a.length){i===a.length-1&&(o=hasProperty(n,a[i])||primitiveHasOwnProperty(n,a[i]));n=n[a[i++]]}}else{n=s.view[e];o=hasProperty(s.view,e)}if(o){r=n;break}s=s.parent}t[e]=r}isFunction(r)&&(r=r.call(this.view));return r};function Writer(){this.templateCache={_cache:{},set:function set(e,t){this._cache[e]=t},get:function get(e){return this._cache[e]},clear:function clear(){this._cache={}}}}Writer.prototype.clearCache=function clearCache(){"undefined"!==typeof this.templateCache&&this.templateCache.clear()};Writer.prototype.parse=function parse(e,t){var r=this.templateCache;var n=e+":"+(t||l.tags).join(":");var a="undefined"!==typeof r;var i=a?r.get(n):void 0;if(void 0==i){i=parseTemplate(e,t);a&&r.set(n,i)}return i};Writer.prototype.render=function render(e,t,r,n){var a=this.getConfigTags(n);var i=this.parse(e,a);var s=t instanceof Context?t:new Context(t,void 0);return this.renderTokens(i,s,r,e,n)};Writer.prototype.renderTokens=function renderTokens(e,t,r,n,a){var i="";var s,o,p;for(var c=0,l=e.length;c<l;++c){p=void 0;s=e[c];o=s[0];"#"===o?p=this.renderSection(s,t,r,n,a):"^"===o?p=this.renderInverted(s,t,r,n,a):">"===o?p=this.renderPartial(s,t,r,a):"&"===o?p=this.unescapedValue(s,t):"name"===o?p=this.escapedValue(s,t,a):"text"===o&&(p=this.rawValue(s));void 0!==p&&(i+=p)}return i};Writer.prototype.renderSection=function renderSection(e,r,n,a,i){var s=this;var o="";var p=r.lookup(e[1]);function subRender(e){return s.render(e,r,n,i)}if(p){if(t(p))for(var c=0,l=p.length;c<l;++c)o+=this.renderTokens(e[4],r.push(p[c]),n,a,i);else if("object"===typeof p||"string"===typeof p||"number"===typeof p)o+=this.renderTokens(e[4],r.push(p),n,a,i);else if(isFunction(p)){if("string"!==typeof a)throw new Error("Cannot use higher-order sections without the original template");p=p.call(r.view,a.slice(e[3],e[5]),subRender);null!=p&&(o+=p)}else o+=this.renderTokens(e[4],r,n,a,i);return o}};Writer.prototype.renderInverted=function renderInverted(e,r,n,a,i){var s=r.lookup(e[1]);if(!s||t(s)&&0===s.length)return this.renderTokens(e[4],r,n,a,i)};Writer.prototype.indentPartial=function indentPartial(e,t,r){var n=t.replace(/[^ \t]/g,"");var a=e.split("\n");for(var i=0;i<a.length;i++)a[i].length&&(i>0||!r)&&(a[i]=n+a[i]);return a.join("\n")};Writer.prototype.renderPartial=function renderPartial(e,t,r,n){if(r){var a=this.getConfigTags(n);var i=isFunction(r)?r(e[1]):r[e[1]];if(null!=i){var s=e[6];var o=e[5];var p=e[4];var c=i;0==o&&p&&(c=this.indentPartial(i,p,s));var l=this.parse(c,a);return this.renderTokens(l,t,r,c,n)}}};Writer.prototype.unescapedValue=function unescapedValue(e,t){var r=t.lookup(e[1]);if(null!=r)return r};Writer.prototype.escapedValue=function escapedValue(e,t,r){var n=this.getConfigEscape(r)||l.escape;var a=t.lookup(e[1]);if(null!=a)return"number"===typeof a&&n===l.escape?String(a):n(a)};Writer.prototype.rawValue=function rawValue(e){return e[1]};Writer.prototype.getConfigTags=function getConfigTags(e){return t(e)?e:e&&"object"===typeof e?e.tags:void 0};Writer.prototype.getConfigEscape=function getConfigEscape(e){return e&&"object"===typeof e&&!t(e)?e.escape:void 0};var l={name:"mustache.js",version:"4.2.0",tags:["{{","}}"],clearCache:void 0,escape:void 0,parse:void 0,render:void 0,Scanner:void 0,Context:void 0,Writer:void 0,set templateCache(e){u.templateCache=e},get templateCache(){return u.templateCache}};var u=new Writer;l.clearCache=function clearCache(){return u.clearCache()};l.parse=function parse(e,t){return u.parse(e,t)};l.render=function render(e,t,r,n){if("string"!==typeof e)throw new TypeError('Invalid template! Template should be a "string" but "'+typeStr(e)+'" was given as the first argument for mustache#render(template, view, partials)');return u.render(e,t,r,n)};l.escape=escapeHtml;l.Scanner=Scanner;l.Context=Context;l.Writer=Writer;export default l;
