<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>PMD - 회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Chrome, Firefox OS and Opera -->
<meta name="theme-color" content="#333333">
<!-- Windows Phone -->
<meta name="msapplication-navbutton-color" content="#333333">
<!-- iOS Safari -->
<meta name="apple-mobile-web-app-status-bar-style" content="#333333">
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="DkV8xFmvtQ7nMWYCmol1ww4lQyT+X8I1QEoAGBfrn+936yfOy8OSwxVwOV+YrsYUhcj0NQ2MCytvVVl7og87RA==" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link href="resources/css/main.071c1ad7.css" rel="stylesheet"> -->
<link rel="shortcut icon" href="favicon.ico?v=2" type="image/x-icon"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script>
	window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","errorBeacon":"bam.nr-data.net","applicationID":"19731324","transactionName":"c11ZQxdbVQpUF0oWWldcQkdKR1ABXxAV","queueTime":0,"applicationTime":51,"agent":""}</script>
<script>
	(window.NREUM||(NREUM={})).loader_config={//
			xpid:"VQcEVV9XCRABXVZRBgIFUg==",
			licenseKey:"21e497a9fb",
			applicationID:"19731324"};
	window.NREUM||(NREUM={}),__nr_require=function(t,e,n){
		function r(n){
			if(!e[n]){
				var o=e[n]={exports:{}};
				t[n][0].call(o.exports,
						function(e){
					var o=t[n][1][e];
					return r(o||e)},o,o.exports)
					}
			return e[n].exports
			}
		if("function"==typeof __nr_require)return __nr_require;
		for(var o=0; o<n.length; o++)r(n[o]);
		return r
		}
	({1:[function(t,e,n){function r(t){
		try{s.console&&console.log(t)
			}catch(e){}}
	var o,i=t("ee"),a=t(25),s={};
	try{o=localStorage.getItem("__nr_flags").split(","),console&&"function"==typeof console.log&&(s.console=!0,o.indexOf("dev")!==-1&&(s.dev=!0),o.indexOf("nr_dev")!==-1&&(s.nrDev=!0))
		}catch(c){}s.nrDev&&i.on("internal-error",
				function(t){r(t.stack)}),s.dev&&i.on("fn-err",
						function(t,e,n){
							r(n.stack)
							}),
					s.dev&&(r("NR AGENT IN DEVELOPMENT MODE"),
							r("flags: "+a(s,function(t,e){return t}).join(", ")))},{}],2:
								[
									function(t,e,n){
								function r(t,e,n,r,s){
								try{l?l-=1:o(s||new UncaughtException(t,e,n),!0)
								}catch(f){
									try{i("ierr",[f,c.now(),!0])
										}catch(d){}
										}return"function"==typeof u&&u.apply(this,a(arguments))}
							function UncaughtException(t,e,n){
											this.message=t||"Uncaught error with no additional information",
											this.sourceURL=e,this.line=n
											}function o(t,e){var n=e?null:c.now();i("err",[t,n])}
											var i=t("handle"),a=t(26),s=t("ee"),c=t("loader"),f=t("gos"),u=window.onerror,d=!1,p="nr@seenError",l=0;c.features.err=!0,t(1),window.onerror=r;
											try{throw new Error
											}catch(h){"stack"in h&&(t(13),t(12),"addEventListener"in window&&t(6),c.xhrWrappable&&t(14),d=!0)
											}s.on("fn-start",function(t,e,n){d&&(l+=1)}),
											s.on("fn-err",function(t,e,n){d&&!n[p]&&(f(n,p,function(){return!0}),this.thrown=!0,o(n))}),
											s.on("fn-end",function(){d&&!this.thrown&&l>0&&(l-=1)}),
											s.on("internal-error",function(t){i("ierr",[t,c.now(),!0])})
											},
											{}
								],
											3:[function(t,e,n){t("loader").features.ins=!0},{}],
											4:[function(t,e,n){
												function r(){
													L++,C=g.hash,this[u]=y.now()
													}
												function o(){
													L--,g.hash!==C&&i(0,!0);
													var t=y.now();
													this[h]=~~this[h]+t-this[u],this[d]=t}
												function i(t,e){
													E.emit("newURL",[""+g,e])
													}function a(t,e){
														t.on(e,function(){this[e]=y.now()})
														}
													var s="-start",c="-end",f="-body",u="fn"+s,d="fn"+c,p="cb"+s,l="cb"+c,h="jsTime",m="fetch",v="addEventListener",w=window,g=w.location,y=t("loader");
													if(w[v]&&y.xhrWrappable){
														var x=t(10),b=t(11),E=t(8),O=t(6),R=t(13),P=t(7),T=t(14),N=t(9),M=t("ee"),S=M.get("tracer");
														t(16),y.features.spa=!0;
														var C,L=0;
														M.on(u,r),M.on(p,r),M.on(d,o),M.on(l,o),M.buffer([u,d,"xhr-done","xhr-resolved"]),O.buffer([u]),R.buffer(["setTimeout"+c,"clearTimeout"+s,u]),T.buffer([u,"new-xhr","send-xhr"+s]),P.buffer([m+s,m+"-done",m+f+s,m+f+c]),E.buffer(["newURL"]),x.buffer([u]),b.buffer(["propagate",p,l,"executor-err","resolve"+s]),S.buffer([u,"no-"+u]),N.buffer(["new-jsonp","cb-start","jsonp-error","jsonp-end"]),a(T,"send-xhr"+s),a(M,"xhr-resolved"),a(M,"xhr-done"),a(P,m+s),a(P,m+"-done"),a(N,"new-jsonp"),a(N,"jsonp-end"),a(N,"cb-start"),E.on("pushState-end",i),E.on("replaceState-end",i),w[v]("hashchange",i,!0),w[v]("load",i,!0),w[v]("popstate",function(){i(0,L>1)},!0)}},{}],
											5:[function(t,e,n){
												function r(t){}
												if(window.performance&&window.performance.timing&&window.performance.getEntriesByType){
													var o=t("ee"),i=t("handle"),a=t(13),s=t(12),c="learResourceTimings",f="addEventListener",u="resourcetimingbufferfull",d="bstResource",p="resource",l="-start",h="-end",m="fn"+l,v="fn"+h,w="bstTimer",g="pushState",y=t("loader");
													y.features.stn=!0,t(8),"addEventListener"in window&&t(6);
													var x=NREUM.o.EV;o.on(m,function(t,e){
														var n=t[0];
														n instanceof x&&(this.bstStart=y.now())}),o.on(v,
																function(t,e){
															var n=t[0];n instanceof x&&i("bst",[n,e,this.bstStart,y.now()])
															}),a.on(m,function(t,e,n){this.bstStart=y.now(),this.bstType=n}),a.on(v,function(t,e){i(w,[e,this.bstStart,y.now(),this.bstType])}),s.on(m,function(){this.bstStart=y.now()}),s.on(v,function(t,e){i(w,[e,this.bstStart,y.now(),"requestAnimationFrame"])}),o.on(g+l,function(t){this.time=y.now(),this.startPath=location.pathname+location.hash}),o.on(g+h,function(t){i("bstHist",[location.pathname+location.hash,this.startPath,this.time])}),f in window.performance&&(window.performance["c"+c]?window.performance[f](u,function(t){i(d,[window.performance.getEntriesByType(p)]),window.performance["c"+c]()},!1):window.performance[f]("webkit"+u,function(t){i(d,[window.performance.getEntriesByType(p)]),window.performance["webkitC"+c]()},!1)),document[f]("scroll",r,{passive:!0}),document[f]("keypress",r,!1),document[f]("click",r,!1)}},{}],6:[function(t,e,n){function r(t){for(var e=t;e&&!e.hasOwnProperty(u);)e=Object.getPrototypeOf(e);e&&o(e)}function o(t){s.inPlace(t,[u,d],"-",i)}function i(t,e){return t[1]}var a=t("ee").get("events"),s=t("wrap-function")(a,!0),c=t("gos"),f=XMLHttpRequest,u="addEventListener",d="removeEventListener";e.exports=a,"getPrototypeOf"in Object?(r(document),r(window),r(f.prototype)):f.prototype.hasOwnProperty(u)&&(o(window),o(f.prototype)),a.on(u+"-start",function(t,e){var n=t[1],r=c(n,"nr@wrapped",function(){function t(){if("function"==typeof n.handleEvent)return n.handleEvent.apply(n,arguments)}var e={object:t,"function":n}[typeof n];return e?s(e,"fn-",null,e.name||"anonymous"):n});this.wrapped=t[1]=r}),a.on(d+"-start",function(t){t[1]=this.wrapped||t[1]})},{}],7:[function(t,e,n){function r(t,e,n){var r=t[e];"function"==typeof r&&(t[e]=function(){var t=i(arguments),e={};o.emit(n+"before-start",[t],e);var a;e[m]&&e[m].dt&&(a=e[m].dt);var s=r.apply(this,t);return o.emit(n+"start",[t,a],s),s.then(function(t){return o.emit(n+"end",[null,t],s),t},function(t){throw o.emit(n+"end",[t],s),t})})}var o=t("ee").get("fetch"),i=t(26),a=t(25);e.exports=o;var s=window,c="fetch-",f=c+"body-",u=["arrayBuffer","blob","json","text","formData"],d=s.Request,p=s.Response,l=s.fetch,h="prototype",m="nr@context";d&&p&&l&&(a(u,function(t,e){r(d[h],e,f),r(p[h],e,f)}),r(s,"fetch",c),o.on(c+"end",function(t,e){var n=this;if(e){var r=e.headers.get("content-length");null!==r&&(n.rxSize=r),o.emit(c+"done",[null,e],n)}else o.emit(c+"done",[t],n)}))},{}],8:[function(t,e,n){var r=t("ee").get("history"),o=t("wrap-function")(r);e.exports=r;var i=window.history&&window.history.constructor&&window.history.constructor.prototype,a=window.history;i&&i.pushState&&i.replaceState&&(a=i),o.inPlace(a,["pushState","replaceState"],"-")},{}],9:[function(t,e,n){function r(t){function e(){c.emit("jsonp-end",[],p),t.removeEventListener("load",e,!1),t.removeEventListener("error",n,!1)}function n(){c.emit("jsonp-error",[],p),c.emit("jsonp-end",[],p),t.removeEventListener("load",e,!1),t.removeEventListener("error",n,!1)}var r=t&&"string"==typeof t.nodeName&&"script"===t.nodeName.toLowerCase();if(r){var o="function"==typeof t.addEventListener;if(o){var a=i(t.src);if(a){var u=s(a),d="function"==typeof u.parent[u.key];if(d){var p={};f.inPlace(u.parent,[u.key],"cb-",p),t.addEventListener("load",e,!1),t.addEventListener("error",n,!1),c.emit("new-jsonp",[t.src],p)}}}}}function o(){return"addEventListener"in window}function i(t){var e=t.match(u);return e?e[1]:null}function a(t,e){var n=t.match(p),r=n[1],o=n[3];return o?a(o,e[r]):e[r]}function s(t){var e=t.match(d);return e&&e.length>=3?{key:e[2],parent:a(e[1],window)}:{key:t,parent:window}}var c=t("ee").get("jsonp"),f=t("wrap-function")(c);if(e.exports=c,o()){var u=/[?&](?:callback|cb)=([^&#]+)/,d=/(.*)\.([^.]+)/,p=/^(\w+)(\.|$)(.*)$/,l=["appendChild","insertBefore","replaceChild"];Node&&Node.prototype&&Node.prototype.appendChild?f.inPlace(Node.prototype,l,"dom-"):(f.inPlace(HTMLElement.prototype,l,"dom-"),f.inPlace(HTMLHeadElement.prototype,l,"dom-"),f.inPlace(HTMLBodyElement.prototype,l,"dom-")),c.on("dom-start",function(t){r(t[0])})}},{}],10:[function(t,e,n){var r=t("ee").get("mutation"),o=t("wrap-function")(r),i=NREUM.o.MO;e.exports=r,i&&(window.MutationObserver=function(t){return this instanceof i?new i(o(t,"fn-")):i.apply(this,arguments)},MutationObserver.prototype=i.prototype)},{}],11:[function(t,e,n){function r(t){var e=a.context(),n=s(t,"executor-",e),r=new f(n);return a.context(r).getCtx=function(){return e},a.emit("new-promise",[r,e],e),r}function o(t,e){return e}var i=t("wrap-function"),a=t("ee").get("promise"),s=i(a),c=t(25),f=NREUM.o.PR;e.exports=a,f&&(window.Promise=r,["all","race"].forEach(function(t){var e=f[t];f[t]=function(n){function r(t){return function(){a.emit("propagate",[null,!o],i),o=o||!t}}var o=!1;c(n,function(e,n){Promise.resolve(n).then(r("all"===t),r(!1))});var i=e.apply(f,arguments),s=f.resolve(i);return s}}),["resolve","reject"].forEach(function(t){var e=f[t];f[t]=function(t){var n=e.apply(f,arguments);return t!==n&&a.emit("propagate",[t,!0],n),n}}),f.prototype["catch"]=function(t){return this.then(null,t)},f.prototype=Object.create(f.prototype,{constructor:{value:r}}),c(Object.getOwnPropertyNames(f),function(t,e){try{r[e]=f[e]}catch(n){}}),a.on("executor-start",function(t){t[0]=s(t[0],"resolve-",this),t[1]=s(t[1],"resolve-",this)}),a.on("executor-err",function(t,e,n){t[1](n)}),s.inPlace(f.prototype,["then"],"then-",o),a.on("then-start",function(t,e){this.promise=e,t[0]=s(t[0],"cb-",this),t[1]=s(t[1],"cb-",this)}),a.on("then-end",function(t,e,n){this.nextPromise=n;var r=this.promise;a.emit("propagate",[r,!0],n)}),a.on("cb-end",function(t,e,n){a.emit("propagate",[n,!0],this.nextPromise)}),a.on("propagate",function(t,e,n){this.getCtx&&!e||(this.getCtx=function(){if(t instanceof Promise)var e=a.context(t);return e&&e.getCtx?e.getCtx():this})}),r.toString=function(){return""+f})},{}],12:[function(t,e,n){var r=t("ee").get("raf"),o=t("wrap-function")(r),i="equestAnimationFrame";e.exports=r,o.inPlace(window,["r"+i,"mozR"+i,"webkitR"+i,"msR"+i],"raf-"),r.on("raf-start",function(t){t[0]=o(t[0],"fn-")})},{}],13:[function(t,e,n){function r(t,e,n){t[0]=a(t[0],"fn-",null,n)}function o(t,e,n){this.method=n,this.timerDuration=isNaN(t[1])?0:+t[1],t[0]=a(t[0],"fn-",this,n)}var i=t("ee").get("timer"),a=t("wrap-function")(i),s="setTimeout",c="setInterval",f="clearTimeout",u="-start",d="-";e.exports=i,a.inPlace(window,[s,"setImmediate"],s+d),a.inPlace(window,[c],c+d),a.inPlace(window,[f,"clearImmediate"],f+d),i.on(c+u,r),i.on(s+u,o)},{}],14:[function(t,e,n){function r(t,e){d.inPlace(e,["onreadystatechange"],"fn-",s)}function o(){var t=this,e=u.context(t);t.readyState>3&&!e.resolved&&(e.resolved=!0,u.emit("xhr-resolved",[],t)),d.inPlace(t,g,"fn-",s)}function i(t){y.push(t),h&&(b?b.then(a):v?v(a):(E=-E,O.data=E))}function a(){for(var t=0;t<y.length;t++)r([],y[t]);y.length&&(y=[])}function s(t,e){return e}function c(t,e){for(var n in t)e[n]=t[n];return e}t(6);var f=t("ee"),u=f.get("xhr"),d=t("wrap-function")(u),p=NREUM.o,l=p.XHR,h=p.MO,m=p.PR,v=p.SI,w="readystatechange",g=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"],y=[];e.exports=u;var x=window.XMLHttpRequest=function(t){var e=new l(t);try{u.emit("new-xhr",[e],e),e.addEventListener(w,o,!1)}catch(n){try{u.emit("internal-error",[n])}catch(r){}}return e};if(c(l,x),x.prototype=l.prototype,d.inPlace(x.prototype,["open","send"],"-xhr-",s),u.on("send-xhr-start",function(t,e){r(t,e),i(e)}),u.on("open-xhr-start",r),h){var b=m&&m.resolve();if(!v&&!m){var E=1,O=document.createTextNode(E);new h(a).observe(O,{characterData:!0})}}else f.on("fn-end",function(t){t[0]&&t[0].type===w||a()})},{}],15:[function(t,e,n){function r(t){if(!i(t))return null;var e=window.NREUM;if(!e.loader_config)return null;var n=(e.loader_config.accountID||"").toString()||null,r=(e.loader_config.agentID||"").toString()||null,s=(e.loader_config.trustKey||"").toString()||null;if(!n||!r)return null;var c=a.generateCatId(),f=a.generateCatId(),u=Date.now(),d=o(c,f,u,n,r,s);return{header:d,guid:c,traceId:f,timestamp:u}}function o(t,e,n,r,o,i){var a="btoa"in window&&"function"==typeof window.btoa;if(!a)return null;var s={v:[0,1],d:{ty:"Browser",ac:r,ap:o,id:t,tr:e,ti:n}};return i&&r!==i&&(s.d.tk=i),btoa(JSON.stringify(s))}function i(t){var e=!1,n=!1,r={};if("init"in NREUM&&"distributed_tracing"in NREUM.init&&(r=NREUM.init.distributed_tracing,n=!!r.enabled),n)if(t.sameOrigin)e=!0;else if(r.allowed_origins instanceof Array)for(var o=0;o<r.allowed_origins.length;o++){var i=s(r.allowed_origins[o]);if(t.hostname===i.hostname&&t.protocol===i.protocol&&t.port===i.port){e=!0;break}}return n&&e}var a=t(23),s=t(17);e.exports={generateTracePayload:r,shouldGenerateTrace:i}},{}],16:[function(t,e,n){function r(t){var e=this.params,n=this.metrics;if(!this.ended){this.ended=!0;for(var r=0;r<p;r++)t.removeEventListener(d[r],this.listener,!1);e.aborted||(n.duration=a.now()-this.startTime,this.loadCaptureCalled||4!==t.readyState?null==e.status&&(e.status=0):i(this,t),n.cbTime=this.cbTime,u.emit("xhr-done",[t],t),s("xhr",[e,n,this.startTime]))}}function o(t,e){var n=c(e),r=t.params;r.host=n.hostname+":"+n.port,r.pathname=n.pathname,t.parsedOrigin=c(e),t.sameOrigin=t.parsedOrigin.sameOrigin}function i(t,e){t.params.status=e.status;var n=v(e,t.lastSize);if(n&&(t.metrics.rxSize=n),t.sameOrigin){var r=e.getResponseHeader("X-NewRelic-App-Data");r&&(t.params.cat=r.split(", ").pop())}t.loadCaptureCalled=!0}var a=t("loader");if(a.xhrWrappable){var s=t("handle"),c=t(17),f=t(15).generateTracePayload,u=t("ee"),d=["load","error","abort","timeout"],p=d.length,l=t("id"),h=t(21),m=t(20),v=t(18),w=window.XMLHttpRequest;a.features.xhr=!0,t(14),t(7),u.on("new-xhr",function(t){var e=this;e.totalCbs=0,e.called=0,e.cbTime=0,e.end=r,e.ended=!1,e.xhrGuids={},e.lastSize=null,e.loadCaptureCalled=!1,t.addEventListener("load",function(n){i(e,t)},!1),h&&(h>34||h<10)||window.opera||t.addEventListener("progress",function(t){e.lastSize=t.loaded},!1)}),u.on("open-xhr-start",function(t){this.params={method:t[0]},o(this,t[1]),this.metrics={}}),u.on("open-xhr-end",function(t,e){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&e.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid);var n=f(this.parsedOrigin);n&&n.header&&(e.setRequestHeader("newrelic",n.header),this.dt=n)}),u.on("send-xhr-start",function(t,e){var n=this.metrics,r=t[0],o=this;if(n&&r){var i=m(r);i&&(n.txSize=i)}this.startTime=a.now(),this.listener=function(t){try{"abort"!==t.type||o.loadCaptureCalled||(o.params.aborted=!0),("load"!==t.type||o.called===o.totalCbs&&(o.onloadCalled||"function"!=typeof e.onload))&&o.end(e)}catch(n){try{u.emit("internal-error",[n])}catch(r){}}};for(var s=0;s<p;s++)e.addEventListener(d[s],this.listener,!1)}),u.on("xhr-cb-time",function(t,e,n){this.cbTime+=t,e?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof n.onload||this.end(n)}),u.on("xhr-load-added",function(t,e){var n=""+l(t)+!!e;this.xhrGuids&&!this.xhrGuids[n]&&(this.xhrGuids[n]=!0,this.totalCbs+=1)}),u.on("xhr-load-removed",function(t,e){var n=""+l(t)+!!e;this.xhrGuids&&this.xhrGuids[n]&&(delete this.xhrGuids[n],this.totalCbs-=1)}),u.on("addEventListener-end",function(t,e){e instanceof w&&"load"===t[0]&&u.emit("xhr-load-added",[t[1],t[2]],e)}),u.on("removeEventListener-end",function(t,e){e instanceof w&&"load"===t[0]&&u.emit("xhr-load-removed",[t[1],t[2]],e)}),u.on("fn-start",function(t,e,n){e instanceof w&&("onload"===n&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=a.now()))}),u.on("fn-end",function(t,e){this.xhrCbStart&&u.emit("xhr-cb-time",[a.now()-this.xhrCbStart,this.onload,e],e)}),u.on("fetch-before-start",function(t){var e,n=t[1]||{};"string"==typeof t[0]?e=t[0]:t[0]&&t[0].url&&(e=t[0].url),e&&(this.parsedOrigin=c(e),this.sameOrigin=this.parsedOrigin.sameOrigin);var r=f(this.parsedOrigin);if(r&&r.header){var o=r.header;if("string"==typeof t[0]){var i={};for(var a in n)i[a]=n[a];i.headers=new Headers(n.headers||{}),i.headers.set("newrelic",o),this.dt=r,t.length>1?t[1]=i:t.push(i)}else t[0]&&t[0].headers&&(t[0].headers.append("newrelic",o),this.dt=r)}})}},{}],17:[function(t,e,n){var r={};e.exports=function(t){if(t in r)return r[t];var e=document.createElement("a"),n=window.location,o={};e.href=t,o.port=e.port;var i=e.href.split("://");!o.port&&i[1]&&(o.port=i[1].split("/")[0].split("@").pop().split(":")[1]),o.port&&"0"!==o.port||(o.port="https"===i[0]?"443":"80"),o.hostname=e.hostname||n.hostname,o.pathname=e.pathname,o.protocol=i[0],"/"!==o.pathname.charAt(0)&&(o.pathname="/"+o.pathname);var a=!e.protocol||":"===e.protocol||e.protocol===n.protocol,s=e.hostname===document.domain&&e.port===n.port;return o.sameOrigin=a&&(!e.hostname||s),"/"===o.pathname&&(r[t]=o),o}},{}],18:[function(t,e,n){function r(t,e){var n=t.responseType;return"json"===n&&null!==e?e:"arraybuffer"===n||"blob"===n||"json"===n?o(t.response):"text"===n||"document"===n||""===n||void 0===n?o(t.responseText):void 0}var o=t(20);e.exports=r},{}],19:[function(t,e,n){function r(){}function o(t,e,n){return function(){return i(t,[f.now()].concat(s(arguments)),e?null:this,n),e?void 0:this}}var i=t("handle"),a=t(25),s=t(26),c=t("ee").get("tracer"),f=t("loader"),u=NREUM;"undefined"==typeof window.newrelic&&(newrelic=u);var d=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],p="api-",l=p+"ixn-";a(d,function(t,e){u[e]=o(p+e,!0,"api")}),u.addPageAction=o(p+"addPageAction",!0),u.setCurrentRouteName=o(p+"routeName",!0),e.exports=newrelic,u.interaction=function(){return(new r).get()};var h=r.prototype={createTracer:function(t,e){var n={},r=this,o="function"==typeof e;return i(l+"tracer",[f.now(),t,n],r),function(){if(c.emit((o?"":"no-")+"fn-start",[f.now(),r,o],n),o)try{return e.apply(this,arguments)}catch(t){throw c.emit("fn-err",[arguments,this,t],n),t}finally{c.emit("fn-end",[f.now()],n)}}}};a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,e){h[e]=o(l+e)}),newrelic.noticeError=function(t,e){"string"==typeof t&&(t=new Error(t)),i("err",[t,f.now(),!1,e])}},{}],20:[function(t,e,n){e.exports=function(t){if("string"==typeof t&&t.length)return t.length;if("object"==typeof t){if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if(!("undefined"!=typeof FormData&&t instanceof FormData))try{return JSON.stringify(t).length}catch(e){return}}}},{}],21:[function(t,e,n){var r=0,o=navigator.userAgent.match(/Firefox[\/\s](\d+\.\d+)/);o&&(r=+o[1]),e.exports=r},{}],22:[function(t,e,n){function r(t,e){var n=t.getEntries();n.forEach(function(t){"first-paint"===t.name?c("timing",["fp",Math.floor(t.startTime)]):"first-contentful-paint"===t.name&&c("timing",["fcp",Math.floor(t.startTime)])})}function o(t,e){var n=t.getEntries();n.length>0&&c("lcp",[n[n.length-1]])}function i(t){if(t instanceof u&&!p){var e,n=Math.round(t.timeStamp);e=n>1e12?Date.now()-n:f.now()-n,p=!0,c("timing",["fi",n,{type:t.type,fid:e}])}}if(!("init"in NREUM&&"page_view_timing"in NREUM.init&&"enabled"in NREUM.init.page_view_timing&&NREUM.init.page_view_timing.enabled===!1)){var a,s,c=t("handle"),f=t("loader"),u=NREUM.o.EV;if("PerformanceObserver"in window&&"function"==typeof window.PerformanceObserver){a=new PerformanceObserver(r),s=new PerformanceObserver(o);try{a.observe({entryTypes:["paint"]}),s.observe({entryTypes:["largest-contentful-paint"]})}catch(d){}}if("addEventListener"in document){var p=!1,l=["click","keydown","mousedown","pointerdown","touchstart"];l.forEach(function(t){document.addEventListener(t,i,!1)})}}},{}],23:[function(t,e,n){function r(){function t(){return e?15&e[n++]:16*Math.random()|0}var e=null,n=0,r=window.crypto||window.msCrypto;r&&r.getRandomValues&&(e=r.getRandomValues(new Uint8Array(31)));for(var o,i="xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx",a="",s=0;s<i.length;s++)o=i[s],"x"===o?a+=t().toString(16):"y"===o?(o=3&t()|8,a+=o.toString(16)):a+=o;return a}function o(){function t(){return e?15&e[n++]:16*Math.random()|0}var e=null,n=0,r=window.crypto||window.msCrypto;r&&r.getRandomValues&&Uint8Array&&(e=r.getRandomValues(new Uint8Array(31)));for(var o=[],i=0;i<16;i++)o.push(t().toString(16));return o.join("")}e.exports={generateUuid:r,generateCatId:o}},{}],24:[function(t,e,n){function r(t,e){if(!o)return!1;if(t!==o)return!1;if(!e)return!0;if(!i)return!1;for(var n=i.split("."),r=e.split("."),a=0;a<r.length;a++)if(r[a]!==n[a])return!1;return!0}var o=null,i=null,a=/Version\/(\S+)\s+Safari/;if(navigator.userAgent){var s=navigator.userAgent,c=s.match(a);c&&s.indexOf("Chrome")===-1&&s.indexOf("Chromium")===-1&&(o="Safari",i=c[1])}e.exports={agent:o,version:i,match:r}},{}],25:[function(t,e,n){function r(t,e){var n=[],r="",i=0;for(r in t)o.call(t,r)&&(n[i]=e(r,t[r]),i+=1);return n}var o=Object.prototype.hasOwnProperty;e.exports=r},{}],26:[function(t,e,n){function r(t,e,n){e||(e=0),"undefined"==typeof n&&(n=t?t.length:0);for(var r=-1,o=n-e||0,i=Array(o<0?0:o);++r<o;)i[r]=t[e+r];return i}e.exports=r},{}],27:[function(t,e,n){e.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(t,e,n){function r(){}function o(t){function e(t){return t&&t instanceof r?t:t?c(t,s,i):i()}function n(n,r,o,i){if(!p.aborted||i){t&&t(n,r,o);for(var a=e(o),s=m(n),c=s.length,f=0;f<c;f++)s[f].apply(a,r);var d=u[y[n]];return d&&d.push([x,n,r,a]),a}}function l(t,e){g[t]=m(t).concat(e)}function h(t,e){var n=g[t];if(n)for(var r=0;r<n.length;r++)n[r]===e&&n.splice(r,1)}function m(t){return g[t]||[]}function v(t){return d[t]=d[t]||o(n)}function w(t,e){f(t,function(t,n){e=e||"feature",y[n]=e,e in u||(u[e]=[])})}var g={},y={},x={on:l,addEventListener:l,removeEventListener:h,emit:n,get:v,listeners:m,context:e,buffer:w,abort:a,aborted:!1};return x}function i(){return new r}function a(){(u.api||u.feature)&&(p.aborted=!0,u=p.backlog={})}var s="nr@context",c=t("gos"),f=t(25),u={},d={},p=e.exports=o();p.backlog=u},{}],gos:[function(t,e,n){function r(t,e,n){if(o.call(t,e))return t[e];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,e,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return t[e]=r,r}var o=Object.prototype.hasOwnProperty;e.exports=r},{}],handle:[function(t,e,n){function r(t,e,n,r){o.buffer([t],r),o.emit(t,e,n)}var o=t("ee").get("handle");e.exports=r,r.ee=o},{}],id:[function(t,e,n){function r(t){var e=typeof t;return!t||"object"!==e&&"function"!==e?-1:t===window?0:a(t,i,function(){return o++})}var o=1,i="nr@id",a=t("gos");e.exports=r},{}],loader:[function(t,e,n){function r(){if(!E++){var t=b.info=NREUM.info,e=l.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&e))return u.abort();f(y,function(e,n){t[e]||(t[e]=n)}),c("mark",["onload",a()+b.offset],null,"api");var n=l.createElement("script");n.src="https://"+t.agent,e.parentNode.insertBefore(n,e)}}function o(){"complete"===l.readyState&&i()}function i(){c("mark",["domContent",a()+b.offset],null,"api")}function a(){return O.exists&&performance.now?Math.round(performance.now()):(s=Math.max((new Date).getTime(),s))-b.offset}var s=(new Date).getTime(),c=t("handle"),f=t(25),u=t("ee"),d=t(24),p=window,l=p.document,h="addEventListener",m="attachEvent",v=p.XMLHttpRequest,w=v&&v.prototype;NREUM.o={ST:setTimeout,SI:p.setImmediate,CT:clearTimeout,XHR:v,REQ:p.Request,EV:p.Event,PR:p.Promise,MO:p.MutationObserver};var g=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-spa-1167.min.js"},x=v&&w&&w[h]&&!/CriOS/.test(navigator.userAgent),b=e.exports={offset:s,now:a,origin:g,features:{},xhrWrappable:x,userAgent:d};t(19),t(22),l[h]?(l[h]("DOMContentLoaded",i,!1),p[h]("load",r,!1)):(l[m]("onreadystatechange",o),p[m]("onload",r)),c("mark",["firstbyte",s],null,"api");var E=0,O=t(27)},{}],"wrap-function":[function(t,e,n){function r(t){return!(t&&t instanceof Function&&t.apply&&!t[a])}var o=t("ee"),i=t(26),a="nr@original",s=Object.prototype.hasOwnProperty,c=!1;e.exports=function(t,e){function n(t,e,n,o){function nrWrapper(){var r,a,s,c;try{a=this,r=i(arguments),s="function"==typeof n?n(r,a):n||{}}catch(f){p([f,"",[r,a,o],s])}u(e+"start",[r,a,o],s);
															try{
																return c=t.apply(a,r)
															} catch (d){ throw u(e+"err",[r,a,d],s),d
															} finally{
																u(e+"end",[r,a,c],s)}
															} return r(t)?t:(e||(e=""),nrWrapper[a]=t,d(t,nrWrapper),nrWrapper)
															}
															
															function f(t,e,o,i){o||(o="");
															var a,s,c,f="-"===o.charAt(0);
															for(c=0;c<e.length; c++ )s=e[c],a=t[s],r(a)||(t[s]=n(a,f?s+o:o,i,s))
															} function u(n,r,o){
																if(!c||e){
																	var i=c;c=!0;
																	try { 
																		t.emit(n,r,o,e)
																	} catch (a){p([a,n,r,o])}c=i}
																}
															function d(t,e){
																if (Object.defineProperty&&Object.keys) 
																	try { 
																	var n=Object.keys(t);
																	return n.forEach(
																			function(n){
																				Object.defineProperty(e,n,{
																					get:function(){return t[n]},
																					set:function(e){
																						return t[n]=e,e}
																				})}
																			), e
																	} catch (r){p([r])}
																	for (var o in t)s.call(t,o)&&(e[o]=t[o]);
																	return e
															} 
															function p(e){
												try{t.emit("internal-error",e)
												}catch(n){}}
											return t||(t=o),n.inPlace=f,n.flag=a,n}},{}]},{},["loader",2,16,5,3,4]);
</script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
  // 미지원 브라우저 IE10
  if (Function('/*@cc_on return document.documentMode===10@*/')()) {
    window.location = '/browser';
  }
</script>
<script charset="utf-8">
  // for electron
  if (window.require) {
    window.nodeRequire = require;
    delete window.require;
    delete window.exports;
    delete window.module;
  }
</script>
<script>
  window.rmbrOauthLoginSuccess = '';
  window.rmbrOauthLoginError = {};
  window.rmbrIsDesktopApp = false;
  window.rmbrToken = '';
  window.rmbrUid = '';
  window.rmbrServiceDomain = 'korea';
  window.rmbrIpRegion = 'KR';
</script>
 
<style>
#root {
  height: 100%
}

	
.OutsideNavigation {
    height: 50px;
    width: 100%;
    background-color: #fff;
    border-bottom: 1px solid #e5e5e5;
    text-align: center;
}

a, abbr, acronym, address, applet, article, aside, audio, b, big,
	blockquote, body, canvas, caption, center, cite, code, dd, del, details,
	dfn, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form,
	h1, h2, h3, h4, h5, h6, header, hgroup, html, i, iframe, img, ins, kbd,
	label, legend, li, main, mark, menu, nav, object, ol, output, p, pre, q,
	ruby, s, samp, section, small, span, strike, strong, sub, summary, sup,
	table, tbody, td, tfoot, th, thead, time, tr, tt, u, ul, var, video{
	margin: 0;
	padding: 0;
	border: 0;	
}


.OauthButton__content {
    -ms-flex: 1 1;
    flex: 1 1;
    -ms-flex-pack: center;
    justify-content: center;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    overflow: hidden;
}


/* 회원가입을 선택하세요 */
.OnBoardingContent__title {
    color: #000;
    font-weight: 500;
    font-size: 28px;
    line-height: 36px;
    text-align: center;
}


/* 회원가입 메인 영역 */
.OnBoardingContent {
    margin: 0 auto;
    padding: 40px 0;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
}

.OnBoardingLayout__content {
    height: calc(100% - 50px);
}

/* 회원가입 메인 영역 */
.OnBoardingContent__content {
    margin-top: 42px;
    width: 650px;
}


/* 버튼 */
.SignUpOauthSelectStep__OauthButton {
    margin: 16px 0;
}
.OauthButton {
    width: 100%;
    height: 48px;
    background-color: #fff;
    border: 1px solid transparent;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    font-size: 16px;
    color: #fff;
    font-weight: 400;
    padding: 12px;
}
.OauthButton__content {
    -ms-flex: 1 1;
    flex: 1 1;
    -ms-flex-pack: center;
    justify-content: center;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    overflow: hidden;
}


.OauthButton__naver, .OauthButton__naver:active, .OauthButton__naver:focus, .OauthButton__naver:hover {
    background-color: #60d04c;
}

.OauthButton__google_plus, .OauthButton__google_plus:active, .OauthButton__google_plus:focus, .OauthButton__google_plus:hover {
    color: #333;
    border-color: #ccc;
}

.OauthButton__google_plus {
    background-color: #fff;
}

.OauthButton__facebook, .OauthButton__facebook:active, .OauthButton__facebook:focus, .OauthButton__facebook:hover {
    background-color: #4d71a7;
}

.OauthButton__email, .OauthButton__email:active, .OauthButton__email:focus, .OauthButton__email:hover {
    background-color: #000;
}

.OauthButton__iconImg {
    width: 24px;
}	

@import url(http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700);
@import url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);

body {
    background: #fff;
	font-family: 'Roboto', sans-serif;
	color:#333;
	line-height: 22px;	
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color:#111;
	margin-top:5px;
	margin-bottom:5px;
}
h1, h2, h3 {
	text-transform:uppercase;
}

input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 12px;
    cursor: pointer;
    opacity: 1;
    filter: alpha(opacity=1);    
}

.form-inline .form-group{
    margin-left: 0;
    margin-right: 0;
}
.control-label {
    color:#333333;
}	

.login-or {
         position: relative;
         color: #aaa;
         margin-top: 10px;
         margin-bottom: 10px;
         padding-top: 10px;
         padding-bottom: 10px;
}
.span-or {
display: block;
position: absolute;
left: 50%;
top: -2px;
margin-left: -25px;
background-color: #fff;
width: 50px;
text-align: center;
}
.hr-or {
height: 1px;
margin-top: 0px !important;
margin-bottom: 0px !important;
}

/* 이메일 중복체크 버튼 */
#cfm_btn, #phone_btn {
	display: inline-block;
	float: left;
	margin-right: 3px;
	background-color: #fff;
	border: 1px solid  #428bca;
	color: #428bca;
	border-radius: 3px;
	padding: 3px;
}
.suss{
	color: rgba(0, 20, 245, 0.7);
}    

#kakako_btn{
	margin: 0;
	padding: 0;
	width: 100%;
    height: 48px;
    background: url("resources/images/kakao_login_btn_medium_wide.png") no-repeat;
    border: none;
    background-size: 100%;
}


</style>

</head>

<body>

	<div id="root">
		<div class="App">
			<div class="OnBoardingLayout">
				<div class="OutsideNavigation" style="background-color: #6a99cb;  height: 100px; padding-top: 20px;  " id="logo" >
					<h1 style="margin: 0; padding: auto; ">
						<a href="main.inc" style="color: #fff; text-decoration: none; font-family: 'Open Sans', Arial,sans-serif; font-weight: 400; font-size: 50px;  ">
							PMD
						</a>
					</h1>
				</div>

				<!-- 회원가입 영역 -->
				<div class="OnBoardingLayout__content">
					<div class="OnBoardingContent">
						<div class="OnBoardingContent__title">회원가입 방법을 선택하세요</div>
						<div class="OnBoardingContent__content">
							<div class="SignUpOauthSelectStep__oauths">
						       <!--  <h1 class="entry-title"><span>PMD로 가입하기</span> </h1>-->
						       <span><small><span class="text-danger">* </span>는 필수 입력 사항입니다.</small></span>
						       
						        <hr style="margin-top: 0;"/> 
						        
					            <form class="form-horizontal" method="post" name="join" id="join"  >
					            
									<div class="form-group">
										<label class="control-label col-sm-2">아이디 <span class="text-danger">*</span></label>
										<div class="col-md-8 col-sm-9" style="margin-right: 0;">
											<div class="input-group"  style="margin-right: 0; padding-right: 0;">
												<span class="input-group-addon" id="idS" ><i class="glyphicon glyphicon-hand-right"></i></span> 
												<input type="text" class="form-control" name="u_id" id="u_id" 
													placeholder="4자 이상 입력하세요" value=""  required="required" autofocus>
											</div>
										</div>
										<div id="box" style="display: inline-block; position: relative; margin-top: 5px; padding-right:0;">
											<!-- -------아이디 중복체크 영역--------- -->
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">비밀번호<span class="text-danger">*</span> </label>
										<div class="col-md-8 col-sm-9">
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
												<input type="password" class="form-control" name="u_pw" required="required"
													id="u_pw" placeholder="4자 이상 입력하세요" value="">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">비밀번호<br/>재확인<span class="text-danger">*</span> </label>
										<div class="col-md-8 col-sm-9" style="margin-right: 0;">
											<div class="input-group"  style="margin-right: 0; padding-right: 0;">
												<span class="input-group-addon" id="pwConf"><i class='glyphicon glyphicon-check'></i> </span> 
												<input type="password" class="form-control" name="cpw" id="cpw" placeholder="비밀번호를 재확인하세요"
													required="required" />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">이름 <span class="text-danger">*</span></label>
										<div class="col-md-8 col-sm-9">
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
												<input type="text" class="form-control" name="u_name" id="u_name" placeholder="이름을 입력하세요"
													value="" required="required" />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">닉네임 <span class="text-danger">*</span> </label>
										<div class="col-md-8 col-sm-9">
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-star"></i></span> 
												<input type="text" class="form-control" name="nickname" id="nickname"
													placeholder="닉네임을 입력하세요" value="" required="required" />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">연락처 <span class="text-danger">*</span> </label>
										<div class="col-md-8 col-sm-9">
											<div class="input-group" style="margin-bottom: 5px;">
												<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span> 
												<input type="tel" class="form-control" name="u_phone" id="u_phone"
													placeholder="ex. 010-1234-1234" pattern="(010)-\d{3,4}-\d{4}">
											</div>
											<div>
												<input type="button" value="연락처 중복체크" id="phone_btn" />
												<div id="p_box"></div>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label class="control-label col-sm-2">이메일<span class="text-danger">*</span></label>
										<div class="col-md-8 col-sm-9">
											<input type="text" id="email" name="email" class="form-control" style="margin-bottom: 4px;" 
													placeholder="이메일을 입력하세요" required="required" />
											<div class="input-group" style="margin-bottom: 5px;">
												<span class="input-group-addon"><i style="font-size:18px" class="fa">&#xf1fa;</i></span>
												<input type="text" name="email" id="input_email" class="form-control" placeholder="@은 빼고 입력하세요" >
												<select id="email2" name="email" class="form-control" >
													<option value="1" selected>::직접입력::</option>
													<option value="naver.com">naver.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="nate.com">nate.com</option>
													<option value="yahoo.co.kr">yahoo.co.kr</option>
													<option value="empas.com">empas.com</option>
													<option value="dreamwiz.com">dreamwiz.com</option>
													<option value="freechal.com">freechal.com</option>
													<option value="lycos.co.kr">lycos.co.kr</option>
													<option value="korea.com">korea.com</option>
													<option value="gmail.com">gmail.com</option>
												</select>
											</div>
											<button type="button" id="cfm_btn" >이메일 중복체크</button>
											<div id="e_box"> </div>
										</div>
										
										
									</div>
									<div style="width: 330px; margin: 0 auto;">
										<button type="button" onclick="location.href='javascript:join()'" style=" background-color: rgba(0, 20, 245, 0.7); margin-left: 0; border-radius:8px;"
												class="ant-btn OauthButton OauthButton__facebook SignUpOauthSelectStep__OauthButton" id="join_btn" >
											<img alt="ImgIconFacebook" class="OauthButton__iconImg" src="resources/images/P_icon.png">
											<div class="OauthButton__content">PMD로 회원가입</div>
										</button>
									</div>	
								</form>
							</div>

							<!-- ----------- OR ----------- -->
							<div class="col-md-12 ">
								<div class="login-or">
									<hr class="hr-or" /> <span class="span-or">or</span>
								</div>
							</div>
							<!-- 소셜 회원가입 버튼 영역 -->
							<div style="width: 330px; margin: 0 auto;">
								<button service="naver" type="button" style="background: #1EC800; border-radius: 8px; font-family: '나눔바른고딕 Bold' " onclick="location.href='${url }'" 
									class="ant-btn OauthButton OauthButton__naver SignUpOauthSelectStep__OauthButton">
									<img alt="ImgIconNaver" class="OauthButton__iconImg"
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3JpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDE0IDc5LjE1Njc5NywgMjAxNC8wOC8yMC0wOTo1MzowMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpmNWVmZjVlMy0zYTU4LWMzNGUtYTMxNS0xYTVkYTE5YTBjMjAiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDNGQzYwNUFDODVEMTFFNDk0NkRCQzQ1MzJEMkZBRDYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDNGQzYwNTlDODVEMTFFNDk0NkRCQzQ1MzJEMkZBRDYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ODAxYjhhMzItZjA4My1kZTQxLTkwMzgtZTIyNzY4ZDZjMWRiIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkUwQTE1MTEzODEzMTExRTRBMkQ2RTFBQUFFMDlENUU0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+DvnoVAAAASJJREFUeNpi/P//PwMtARMDjcHwtOAOEH8C4jdA/AGIPwJxIhZ1AkB8H0ntJ6heFMCIJZL/gcTRxP4CsSIQP0YSEwLit2jq/qM7GpsP3mERYwbijVgc8oGQXlLiwBCIm5F9T4tIrgFic1qnovVQ+j006KhugSQQ90HZ3wkpZiHCQFBK4UdTWwjEl4D4HhCLUeqD20Ach0V8HhCrUSOIlIF4ORB3ouchaF6g2AIOqGEVaBmNaqnoL7RYAAF/WhV2sPLkPBDX0joftADxSWIVYyvsfqMlSZACEbRyBpQXHgAxG5reP0DMSsgHr6EF2Xco/QopiGDgORAnQx3zB0nta2IyWgYQ8wLxL6gLv0AxOlgCtYAJaglI7Wdigmi0TkYBAAEGAElhSK5ZcYQXAAAAAElFTkSuQmCC">
									<div class="OauthButton__content">네이버로 회원가입</div>
								</button>
								<button service="google_plus" type="button"  style="color: #333333; border-color: #ccc;  border-radius:8px;" id="sns_btn"
									class="ant-btn OauthButton OauthButton__google_plus SignUpOauthSelectStep__OauthButton">
									<img alt="ImgIconGoogle" class="OauthButton__iconImg"
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAr1JREFUSA3tVU1ME1EQnllaEFoIwbbG6MVgJJrUxIg0IAiKLV40GosxsTHx4Nl4UQOXXjQmmmg8mXgw/sRA4SQ3aJF/QwsHgyd/8IKY0IJG8I/u7jivZtmfLqCJR97lvffNN9/szJv3FmBjrFMBXMcO88FASCE6x7w6INjOs4xAHwGlIUS109OXSqylsWqAdHPNLgJ6mBNeQwERBgmli76+8bd2NNsA6WBtI6hKDwcotXOyYoj42SnB/vLe5AerzWEF0scOVoGcfW4VZ5EFAJoC/lye/QRQvuJL8MBOXNiZbBny8n0iKtNQIcxpRjz1JVu88VSTN5E85GlweSVJOg+I82y/xdhVjW+dTSXKJopCyrTr9mKs0kMqbGVyxoGOIxXxl1NWR7FfDNX5SnvH5uxstpgcL3yUjTsp21OSyZzYN5EJBiK2xH8ATRnIicJ3XJ5K4Y8E8wWj7T6MRlWjXvONpVdsdRsx45r9Z/rb3Y0aZj5kItHnuUESvLaKCwMf7g6g1bsLAVc0BD//kAX6H4c5A8QZ/jqtRLs5XW4SLpZp4BvOQy8RYgH77NQp9F5fA5gDEIyysVIm6dPlxdrvk7GweCKeGh3621zVxn3z9R8RAuWJjuG4vraUiCR8lobiyeNfWtwTy5tFJncD3af3Gh2M66M3f/GFU+4YMZZ8bNybukgYqjvDw5xyvUYSF41Lcsnl83cMHI7KAm96EXV8m5s6W7RwKlK4cLJF4/I8ZOwggecHiLVWoUpJfipWbnOOmAsE2oXz8/lUCLzg554B9+yVBpZa4orXJNo28RnpIy+AMB2ItTYCqT1E8FePnSRXDJfN3GuLXyse0aX/rGzbNHWmaxCdjmru6TGrQ94eccTh+nrBTlxwbTMwigS6wiFFhdwPh8nbuGcVJJrlh26Ib1FHqrV7zR+OUWtjbVuB3wfJ7N0eK6i5AAAAAElFTkSuQmCC">
									<div class="OauthButton__content">구글로 회원가입</div>
								</button>
								<button onclick="javascript:loginWithKakao()" service="email" type="button" id="kakako_btn"  
								 class="OauthButton ">
								 	<!-- <img alt="카카오 로그인" src="resources/images/kakao_login_btn_medium_wide.png" style="margin: 0; padding: 0; background-size: 329px; "> -->
								</button>
							</div>
						</div>
							
						<div class="OnBoardingContent__footer">
							<span>
								기존에 PMD를 사용하셨나요? <a href="login.inc"><b style="text-decoration: underline;">로그인</b></a>
							</span>
						</div>
					  </div>
					</div>
				</div>
				
			</div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	
	
	
	<!--[if (!IE) | (gte IE 10) ]><!-->
	<!-- <script src="resources/js/main.3f19178e.js"></script> -->
	<input type="hidden" id="naver_state" val="325e33b1163936439c34fb65ab18fe36" />
	<input type="hidden" id="line_state" val="8a58e540af5e4314d022e48e7b2234cf" />
	
	<!--<![endif]-->
	<div id="fb-root" class=" fb_reset">
		<div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>
	
	
	
	<div>
		<form action="kakaoLogin.inc" method="post" name="kakaoFrm">
			<input type="hidden" name="sns_id"/>
			<input type="hidden" name="nickname"/>
			<input type="hidden" name="email"/>
		</form>
	</div>
	
	
	
	<!-- ----------------- script ----------------- -->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	
	// 카카오 인증키 등록
    Kakao.init('5899acc3cddfce334c3dd49beff92a37');

    // SDK 초기화 여부를 판단합니다. true면 정상등록
    // console.log(Kakao.isInitialized());
    function loginWithKakao() {
	    Kakao.Auth.login({
	      success: function(authObj) {
	    	  Kakao.API.request({
    	        url: '/v2/user/me',
    	        success: function(res) {
    	          // alert(JSON.stringify(res))
    	          // console.log(JSON.stringify(res))
    	          sendData(res)
    	        },
    	        fail: function(error) {
    	          alert(
    	            'login success, but failed to request user information: ' +
    	              JSON.stringify(error)
    	          )
    	        },
    	      })
	      },
	      fail: function(err) {
	        alert(JSON.stringify(err))
	      },
	    })
	  }
    
    function sendData(res) {
		var id = res["id"];
		var kakao_account = res["kakao_account"];
		var profile = kakao_account["profile"];
		var nickname = profile["nickname"];
		var email = kakao_account["email"];
		
		document.kakaoFrm.sns_id.value = id;
		document.kakaoFrm.nickname.value = nickname;
		
		if(email != undefined){
			document.kakaoFrm.email.value = email;
		}
		
		document.kakaoFrm.submit();
	}
	
	
	// 'PMD로 회원가입' 버튼 눌렀을 때
	function join(){
		
		var u_id = $("#u_id").val().trim();
		var u_pw = $("#u_pw").val().trim();
		var cpw = $("#cpw").val().trim();
		var u_name = $("#u_name").val().trim();
		var nickname = $("#nickname").val().trim();
		var u_phone = $("#u_phone").val().trim();
		var email = $("#email").val().trim() + "@"+$("#input_email").val().trim();
		
		
		if( u_id.length <4){
			alert("아이디를 4자 이상 입력하세요!");
			$("#u_id").focus();
			return;
		}
		if( u_pw.length <4){
			alert("비밀번호를 4자 이상 입력하세요!");
			$("#u_pw").focus();
			return;
		}
	 	if( cpw.length <4){
			alert("비밀번호를 재확인하세요!");
			$("#cpw").focus();
			return;
		} 
		if( u_name.length <1){
			alert("이름을 입력하세요!");
			$("#u_name").focus();
			return;
		}
		if( nickname.length <1){
			alert("닉네임을 입력하세요!");
			$("#nickname").focus();
			return;
		}
		if( u_phone.length <1){
			alert("연락처를 입력하세요!");
			$("#u_phone").focus();
			return;
		}
		if( email.length <12){
			alert("이메일을 입력하세요!");
			$("#email").focus();
			return;
		}
		
		
		var param = "u_id="+encodeURIComponent(u_id)+
				"&u_pw="+encodeURIComponent(u_pw)+
				"&u_name="+encodeURIComponent(u_name)+
				"&nickname="+encodeURIComponent(nickname)+
				"&u_phone="+encodeURIComponent(u_phone)+
				"&email="+encodeURIComponent(email);
		
		$.ajax({
			url: "join.inc",
			type: "POST",
			data: param
			
		}).done(function(data){
			if(data.res == true){
				window.alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
				window.location.href ="login.inc";
			}
		}).fail(function(err){
			console.log(err);
			
		});
		
		
	}
	
	
	
	
	$(function(){
		
		
		/* 비밀번호 재확인 */
		$("#cpw, #u_pw").on("keyup", function(){
			
			var u_pw = $("#u_pw").val().trim();
			var cpw = $("#cpw").val().trim();
			
			if(u_pw == cpw){ // 비밀번호가 같으면
				$("#pwConf").html("<i class='glyphicon glyphicon-check suss'></i>");
			} else {
				$("#pwConf").html("<i class='glyphicon glyphicon-check'></i>");
			}
			
		});
		
		//아이디 중복 체크	ConfirmAction
		$("#u_id").bind("keyup",function(){
		      //사용자가 입력한 id값을 얻어낸다.
		      var str = $(this).val();
		      
		      if(str.trim().length>3){
		     	//id 4자이상 입력시 수행   
		         
		         $.ajax({
		            
		            url: "idchk.inc",
		            type: "post",
		            data: "u_id="+encodeURIComponent(str.trim())
		            
		         }).done(function (data) {
		            if(data.value == true){
		               //id가 중복일 때,
		               $("#box").html("<small style='color:red; font-weight:bold; background: #fff; font-size: 75%;'>사용 불가능</small>");
		               $("#u_id").focus();
		               
		            }else{
		               //id가 중복이 아닐 때,
		               $("#box").html("<small style='color:green; font-weight:bold; background: #fff;font-size: 75%;'>사용 가능</small>");
		               //$("#idS").html("<i class='glyphicon glyphicon-hand-right suss'></i>");
		            }
		            
		         }).fail(function (err) {
		            console.log(err);
		         });
	         
		      }else{
		         $("#box").html("");
		      }
		   
		});
		
		// 이메일 중복 체크 ConfirmAction
		$("#cfm_btn").bind("click",function(){
		      
			var email = $("#email").val().trim() + "@"+$("#input_email").val().trim();
		    
			if(email.length > 12 ){
		     	//email 4자이상 입력시 수행   
		     	
		         
		         $.ajax({
		            
		            url: "emailchk.inc",
		            type: "post",
		            data: "email="+encodeURIComponent(email)
		            
		         }).done(function (data) {
		            if(data.value == true){
		               // 이메일이 중복일 때,
		               $("#e_box").html("<small style='color:red; font-weight:bold; background: #fff;font-size: 75%;'>사용 불가능</small>");
		               
		            }else{
		               // 이메일이 중복이 아닐 때,
		               $("#e_box").html("<small style='color:green; font-weight:bold; background: #fff;font-size: 75%;'>사용 가능</small>");
		            }
		            
		         }).fail(function (err) {
		            console.log(err);
		         });
	         
		      } else{
		         $("#e_box").html("&nbsp;<small style='color:#666f77; font-weight:bold; background: #fff;font-size: 75%;'>이메일을 정확히 입력해주세요!</small>");
		      }
		   
		});
		
		// 이메일 입력방식 선택
		$("#email2").change(function(){
			$("#email2 option:selected").each(function(){
				
				if($(this).val() == '1'){	 //직접입력 일 경우
					$("#input_email").val(''); // 값 초기화
					$("#input_email").focus();
				} else{	//직접 입력이 아닐 경우
					$("#input_email").val($(this).text());	//선택값 입력
				}
			});
			
		});
		
		// 연락처 중복 체크 ConfirmAction
		$("#phone_btn").bind("click",function(){
		      
			var u_phone = $("#u_phone").val().trim();
		    
			if(u_phone.length > 2 ){
		     	// 연락처를 3자이상 입력시 수행   
		         $.ajax({
		            
		            url: "phonechk.inc",
		            type: "post",
		            data: "u_phone="+encodeURIComponent(u_phone)
		            
		         }).done(function (data) {
		            if(data.value == true){
		               // 연락처가 중복일 때,
		               $("#p_box").html("<small style='color:red; font-weight:bold; background: #fff;font-size: 75%;'>사용 불가능</small>");
		               
		            }else{
		               // 연락처가 중복이 아닐 때,
		               $("#p_box").html("<small style='color:green; font-weight:bold; background: #fff;font-size: 75%;'>사용 가능</small>");
		            }
		            
		         }).fail(function (err) {
		            console.log(err);
		         });
	         
		      } else{
		         $("#p_box").html("&nbsp;<small style='color:#666f77; font-weight:bold; background: #fff;font-size: 75%;'>연락처를 정확히 입력해주세요!</small>");
		      }
		   
		});
		
		
		
		
	});
	</script>








</body>
</html>
