/* jqBootstrapValidation
 * A plugin for automating validation on Twitter Bootstrap formatted forms.
 *
 * v1.3.6
 *
 * License: MIT <http://opensource.org/licenses/mit-license.php> - see LICENSE file
 *
 * http://ReactiveRaven.github.com/jqBootstrapValidation/
 */
(function(e){function m(b){return b.toLowerCase().replace(/(^|\s)([a-z])/g,function(c,a,b){return a+b.toUpperCase()})}function q(b,c){for(var a=Array.prototype.slice.call(arguments).splice(2),e=b.split("."),f=e.pop(),h=0;h<e.length;h++)c=c[e[h]];c[f].apply(this,a)}var n=[],g={options:{Y:!1,I:!0,Z:!0,aa:!1,ba:!1,$:!1,u:{F:!0},filter:function(){return!0}},q:{c:function(b){var c=e.extend(!0,{},g);c.options=e.extend(!0,c.options,b);b=e.unique(this.map(function(){return e(this).j("form")[0]}).ea());e(b); return this.d(function(){var a=e(this),b=a.j(".control-group").first(),f=b.find(".help-block").first();a.j("form").first();var h=[];!f.length&&c.options.u&&c.options.u.F&&(f=e('<div class="help-block" />'),b.find(".controls").append(f),n.push(f[0]));if(c.options.I){var d="";void 0!==a.a("pattern")&&(d="Not in the expected format\x3c!-- data-validation-pattern-message to override --\x3e",a.data("validationPatternMessage")&&(d=a.data("validationPatternMessage")),a.data("validationPatternMessage",d), a.data("validationPatternRegex",a.a("pattern")));if(void 0!==a.a("max")||void 0!==a.a("aria-valuemax")){var g=void 0!==a.a("max")?a.a("max"):a.a("aria-valuemax"),d="Too high: Maximum of '"+g+"'\x3c!-- data-validation-max-message to override --\x3e";a.data("validationMaxMessage")&&(d=a.data("validationMaxMessage"));a.data("validationMaxMessage",d);a.data("validationMaxMax",g)}if(void 0!==a.a("min")||void 0!==a.a("aria-valuemin"))g=void 0!==a.a("min")?a.a("min"):a.a("aria-valuemin"),d="Too low: Minimum of '"+ g+"'\x3c!-- data-validation-min-message to override --\x3e",a.data("validationMinMessage")&&(d=a.data("validationMinMessage")),a.data("validationMinMessage",d),a.data("validationMinMin",g);void 0!==a.a("maxlength")&&(d="Too long: Maximum of '"+a.a("maxlength")+"' characters\x3c!-- data-validation-maxlength-message to override --\x3e",a.data("validationMaxlengthMessage")&&(d=a.data("validationMaxlengthMessage")),a.data("validationMaxlengthMessage",d),a.data("validationMaxlengthMaxlength",a.a("maxlength"))); void 0!==a.a("minlength")&&(d="Too short: Minimum of '"+a.a("minlength")+"' characters\x3c!-- data-validation-minlength-message to override --\x3e",a.data("validationMinlengthMessage")&&(d=a.data("validationMinlengthMessage")),a.data("validationMinlengthMessage",d),a.data("validationMinlengthMinlength",a.a("minlength")));if(void 0!==a.a("required")||void 0!==a.a("aria-required"))d=c.i.required.message,a.data("validationRequiredMessage")&&(d=a.data("validationRequiredMessage")),a.data("validationRequiredMessage", d);void 0!==a.a("type")&&"number"===a.a("type").toLowerCase()&&(d=c.i.H.message,a.data("validationNumberMessage")&&(d=a.data("validationNumberMessage")),a.data("validationNumberMessage",d));void 0!==a.a("type")&&"email"===a.a("type").toLowerCase()&&(d="Not a valid email address\x3c!-- data-validator-validemail-message to override --\x3e",a.data("validationValidemailMessage")?d=a.data("validationValidemailMessage"):a.data("validationEmailMessage")&&(d=a.data("validationEmailMessage")),a.data("validationValidemailMessage", d));void 0!==a.a("minchecked")&&(d="Not enough options checked; Minimum of '"+a.a("minchecked")+"' required\x3c!-- data-validation-minchecked-message to override --\x3e",a.data("validationMincheckedMessage")&&(d=a.data("validationMincheckedMessage")),a.data("validationMincheckedMessage",d),a.data("validationMincheckedMinchecked",a.a("minchecked")));void 0!==a.a("maxchecked")&&(d="Too many options checked; Maximum of '"+a.a("maxchecked")+"' required\x3c!-- data-validation-maxchecked-message to override --\x3e", a.data("validationMaxcheckedMessage")&&(d=a.data("validationMaxcheckedMessage")),a.data("validationMaxcheckedMessage",d),a.data("validationMaxcheckedMaxchecked",a.a("maxchecked")))}void 0!==a.data("validation")&&(h=a.data("validation").split(","));e.d(a.data(),function(a){a=a.replace(/([A-Z])/g,",$1").split(",");"validation"===a[0]&&a[1]&&h.push(a[1])});var d=h,k=[];do e.d(h,function(a,b){h[a]=m(b)}),h=e.unique(h),k=[],e.d(d,function(b,d){if(void 0!==a.data("validation"+d+"Shortcut"))e.d(a.data("validation"+ d+"Shortcut").split(","),function(a,b){k.push(b)});else if(c.i[d.toLowerCase()]){var f=c.i[d.toLowerCase()];"shortcut"===f.type.toLowerCase()&&e.d(f.s.split(","),function(a,b){b=m(b);k.push(b);h.push(b)})}}),d=k;while(0<d.length);var l={};e.d(h,function(b,d){var f=a.data("validation"+d+"Message"),p=void 0!==f,h=!1,f=f?f:"'"+d+"' validation failed \x3c!-- Add attribute 'data-validation-"+d.toLowerCase()+"-message' to input to change this message --\x3e";e.d(c.C,function(b,c){void 0===l[b]&&(l[b]=[]); h||void 0===a.data("validation"+d+m(c.name))||(l[b].push(e.extend(!0,{name:m(c.name),message:f},c.c(a,d))),h=!0)});if(!h&&c.i[d.toLowerCase()]){var g=e.extend(!0,{},c.i[d.toLowerCase()]);p&&(g.message=f);var k=g.type.toLowerCase();"shortcut"===k?h=!0:e.d(c.C,function(b,c){void 0===l[b]&&(l[b]=[]);h||k!==b.toLowerCase()||(a.data("validation"+d+m(c.name),g[c.name.toLowerCase()]),l[k].push(e.extend(g,c.c(a,d))),h=!0)})}h||e.error("Cannot find validation info for '"+d+"'")});f.data("original-contents", f.data("original-contents")?f.data("original-contents"):f.G());f.data("original-role",f.data("original-role")?f.data("original-role"):f.a("role"));b.data("original-classes",b.data("original-clases")?b.data("original-classes"):b.a("class"));a.data("original-aria-invalid",a.data("original-aria-invalid")?a.data("original-aria-invalid"):a.a("aria-invalid"))})},L:function(){return this.d(function(){var b=e(this),c=b.j(".control-group").first(),a=c.find(".help-block").first();b.fa(".validation");a.G(a.data("original-contents")); c.a("class",c.data("original-classes"));b.a("aria-invalid",b.data("original-aria-invalid"));a.a("role",b.data("original-role"));-1<n.indexOf(a[0])&&a.remove()})},K:function(){var b={};this.d(function(c,a){var g=e(a),f=g.a("name"),g=g.B("validation.validation",{Q:!0});b[f]=e.extend(!0,g,b[f])});e.d(b,function(c,a){0===a.length&&delete b[c]});return b},P:function(){var b=[];this.d(function(c,a){b=b.concat(e(a).B("getValidators.validation")?e(a).B("validation.validation",{ca:!0}):[])});return 0<b.length}, U:function(b){g=e.extend(!0,g,b)}},C:{v:{name:"callback",c:function(b,c){return{m:c,v:b.data("validation"+c+"Callback"),h:b.t(),g:!0,e:!0}},f:function(b,c,a){if(a.h===c&&a.e)return!a.g;!0===a.e&&(a.h=c,a.g=!0,a.e=!1,q(a.v,window,b,c,function(c){a.h===c.value&&(a.g=c.valid,c.message&&(a.message=c.message),a.e=!0,b.data("validation"+a.m+"Message",a.message),setTimeout(function(){b.A("change.validation")},1))}));return!1}},D:{name:"ajax",c:function(b,c){return{m:c,url:b.data("validation"+c+"Ajax"),h:b.t(), g:!0,e:!0}},f:function(b,c,a){if(""+a.h===""+c&&!0===a.e)return!1===a.g;!0===a.e&&(a.h=c,a.g=!0,a.e=!1,e.D({url:a.url,data:"value="+c+"&field="+b.a("name"),dataType:"json",da:function(c){""+a.h===""+c.value&&(a.g=!!c.valid,c.message&&(a.message=c.message),a.e=!0,b.data("validation"+a.m+"Message",a.message),setTimeout(function(){b.A("change.validation")},1))},N:function(){a.g=!0;a.message="ajax call failed";a.e=!0;b.data("validation"+a.m+"Message",a.message);setTimeout(function(){b.A("change.validation")}, 1)}}));return!1}},k:{name:"regex",c:function(b,c){var a=b.data("validation"+c+"Regex");return{k:RegExp("^"+a+"$")}},f:function(b,c,a){return!a.k.test(c)&&!a.b||a.k.test(c)&&a.b}},required:{name:"required",c:function(){return{}},f:function(b,c,a){return!(0!==c.length||a.b)||!!(0<c.length&&a.b)},n:!0},match:{name:"match",c:function(b,c){return{element:b.j("form").first().find('[name="'+b.data("validation"+c+"Match")+'"]').first()}},f:function(b,c,a){return c!==a.element.t()&&!a.b||c===a.element.t()&& a.b},n:!0},max:{name:"max",c:function(b,c){return{max:b.data("validation"+c+"Max")}},f:function(b,c,a){return parseFloat(c,10)>parseFloat(a.max,10)&&!a.b||parseFloat(c,10)<=parseFloat(a.max,10)&&a.b}},min:{name:"min",c:function(b,c){return{min:b.data("validation"+c+"Min")}},f:function(b,c,a){return parseFloat(c)<parseFloat(a.min)&&!a.b||parseFloat(c)>=parseFloat(a.min)&&a.b}},p:{name:"maxlength",c:function(b,c){return{p:b.data("validation"+c+"Maxlength")}},f:function(b,c,a){return c.length>a.p&&!a.b|| c.length<=a.p&&a.b}},r:{name:"minlength",c:function(b,c){return{r:b.data("validation"+c+"Minlength")}},f:function(b,c,a){return c.length<a.r&&!a.b||c.length>=a.r&&a.b}},o:{name:"maxchecked",c:function(b,c){var a=b.j("form").first().find('[name="'+b.a("name")+'"]');return{o:b.data("validation"+c+"Maxchecked"),elements:a}},f:function(b,c,a){return a.elements.filter(":checked").length>a.o&&!a.b||a.elements.filter(":checked").length<=a.o&&a.b},n:!0},l:{name:"minchecked",c:function(b,c){var a=b.j("form").first().find('[name="'+ b.a("name")+'"]');return{l:b.data("validation"+c+"Minchecked"),elements:a}},f:function(b,c,a){return a.elements.filter(":checked").length<a.l&&!a.b||a.elements.filter(":checked").length>=a.l&&a.b},n:!0}},i:{M:{name:"Email",type:"shortcut",s:"validemail"},ga:{name:"Validemail",type:"regex",k:"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}",message:"Not a valid email address\x3c!-- data-validator-validemail-message to override --\x3e"},V:{name:"Passwordagain",type:"match",match:"password",message:"Does not match the given password\x3c!-- data-validator-paswordagain-message to override --\x3e"}, W:{name:"Positive",type:"shortcut",s:"number,positivenumber"},b:{name:"Negative",type:"shortcut",s:"number,negativenumber"},H:{name:"Number",type:"regex",k:"([+-]?\\d+(\\.\\d*)?([eE][+-]?[0-9]+)?)?",message:"Must be a number\x3c!-- data-validator-number-message to override --\x3e"},R:{name:"Integer",type:"regex",k:"[+-]?\\d+",message:"No decimal places allowed\x3c!-- data-validator-integer-message to override --\x3e"},X:{name:"Positivenumber",type:"min",min:0,message:"Must be a positive number\x3c!-- data-validator-positivenumber-message to override --\x3e"}, S:{name:"Negativenumber",type:"max",max:0,message:"Must be a negative number\x3c!-- data-validator-negativenumber-message to override --\x3e"},required:{name:"Required",type:"required",message:"This is required\x3c!-- data-validator-required-message to override --\x3e"},J:{name:"Checkone",type:"minchecked",l:1,message:"Check at least one option\x3c!-- data-validation-checkone-message to override --\x3e"}}};e.O.w=function(b){return g.q[b]?g.q[b].apply(this,Array.prototype.slice.call(arguments,1)): "object"!==typeof b&&b?(e.error("Method "+b+" does not exist on jQuery.jqBootstrapValidation"),null):g.q.c.apply(this,arguments)};e.w=function(b){e(":input").T("[type=image],[type=submit]").w.apply(this,arguments)}})(jQuery);
