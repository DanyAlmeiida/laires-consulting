(()=>{"use strict";function t(e){return t="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},t(e)}function e(t,e){for(var o=0;o<e.length;o++){var i=e[o];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(t,n(i.key),i)}}function n(e){var n=function(e,n){if("object"!=t(e)||!e)return e;var o=e[Symbol.toPrimitive];if(void 0!==o){var i=o.call(e,n||"default");if("object"!=t(i))return i;throw new TypeError("@@toPrimitive must return a primitive value.")}return("string"===n?String:Number)(e)}(e,"string");return"symbol"==t(n)?n:String(n)}var o=function(){function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)}var n,o,i;return n=t,(o=[{key:"init",value:function(){$(".toggle-payment-item").off("click").on("click",(function(t){$(t.currentTarget).closest("tbody").find(".payment-content-item").toggleClass("hidden"),window.EDITOR=(new EditorManagement).init(),window.EditorManagement=window.EditorManagement||EditorManagement})),$(".disable-payment-item").off("click").on("click",(function(t){t.preventDefault();var e=$(t.currentTarget);$("#confirm-disable-payment-method-modal").modal("show"),$("#confirm-disable-payment-method-button").on("click",(function(t){t.preventDefault(),$httpClient.make().withButtonLoading($(t.currentTarget)).post(route("payments.methods.update.status"),{type:e.closest("form").find(".payment_type").val()}).then((function(n){var o=n.data;o.error?Botble.showError(o.message):(e.closest("tbody").find(".payment-name-label-group").addClass("hidden"),e.closest("tbody").find(".edit-payment-item-btn-trigger").addClass("hidden"),e.closest("tbody").find(".save-payment-item-btn-trigger").removeClass("hidden"),e.closest("tbody").find(".btn-text-trigger-update").addClass("hidden"),e.closest("tbody").find(".btn-text-trigger-save").removeClass("hidden"),e.addClass("hidden"),$(t.currentTarget).closest(".modal").modal("hide"),Botble.showSuccess(o.message))}))}))})),$(".save-payment-item").off("click").on("click",(function(t){t.preventDefault();var e=$(t.currentTarget),n=e.closest("form");if("undefined"!=typeof tinymce)for(var o in tinymce.editors)tinymce.editors[o].getContent&&$("#".concat(o)).html(tinymce.editors[o].getContent());$httpClient.make().withButtonLoading(e).post(n.prop("action")+window.location.search,n.serialize()).then((function(t){var n=t.data;e.closest("tbody").find(".payment-name-label-group").removeClass("hidden"),e.closest("tbody").find(".method-name-label").text(e.closest("form").find("input.input-name").val()),e.closest("tbody").find(".disable-payment-item").removeClass("hidden"),e.closest("tbody").find(".edit-payment-item-btn-trigger").removeClass("hidden"),e.closest("tbody").find(".save-payment-item-btn-trigger").addClass("hidden"),e.closest("tbody").find(".btn-text-trigger-update").removeClass("hidden"),e.closest("tbody").find(".btn-text-trigger-save").addClass("hidden"),Botble.showSuccess(n.message)}))}))}}])&&e(n.prototype,o),i&&e(n,i),Object.defineProperty(n,"prototype",{writable:!1}),t}();$((function(){(new o).init()}))})();