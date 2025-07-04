jQuery(document).ready(function () {
  if (!clientLoggedIn) {
    if (
      jQuery("#order-standard_cart")
        .find(".cart-sidebar")
        .find(".panel-sidebar").length > 0
    ) {
      jQuery("#order-standard_cart")
        .find(".cart-sidebar")
        .find(".panel-sidebar")
        .find(".card-header")
        .find(".panel-title")
        .each(function () {
          if (jQuery(this).find("i.panel-minimise").hasClass("minimised")) {
            jQuery(this).find("i.panel-minimise").click();
          }
        });
    }
  }
});
function triggerSearchButtonToggle(obj) {
  if (jQuery(obj).find("i").hasClass("fa-search")) {
    jQuery(".form-knowldegbase-20i").removeClass("w-hidden");
    jQuery(obj)
      .find("i")
      .removeClass("fas fa-search fa-fw")
      .addClass("fas fa-times fa-fw");
  } else if (jQuery(obj).find("i").hasClass("fa-times")) {
    jQuery(".form-knowldegbase-20i").addClass("w-hidden");
    jQuery(obj)
      .find("i")
      .removeClass("fas fa-times fa-fw")
      .addClass("fas fa-search fa-fw");
  }
}
function triggerSearchButtonToggleWithoutLogin(obj) {
  if (jQuery(obj).find("i").hasClass("fa-search")) {
    jQuery("#nav").addClass("w-hidden");
    jQuery(".form-knowldegbase-20i-without-login").removeClass("w-hidden");
    jQuery(obj)
      .find("i")
      .removeClass("fas fa-search fa-fw")
      .addClass("fas fa-times fa-fw");
  } else if (jQuery(obj).find("i").hasClass("fa-times")) {
    jQuery(".form-knowldegbase-20i-without-login").addClass("w-hidden");
    jQuery("#nav").removeClass("w-hidden");
    jQuery(obj)
      .find("i")
      .removeClass("fas fa-times fa-fw")
      .addClass("fas fa-search fa-fw");
  }
}



/* add  custom js for search bubbling*/





jQuery(document).ready(function () {
  var submitIcon = jQuery(".searchbar-icon");
  var inputBox = jQuery(".searchbar-input");
  var searchbar = jQuery(".searchbar");
  var isOpen = !1;
  submitIcon.click(function () {
    if (isOpen == !1) {
      searchbar.addClass("searchbar-open");
      jQuery("#execphp-2").hide();
      jQuery(".login_logout ").css("width", "100%");
      jQuery(".login_logout ").css("justify-content", "center");
      jQuery(".login_logout ").css("padding-left", "480px");
      inputBox.focus();
      isOpen = !0;
    } else {
      searchbar.removeClass("searchbar-open");
      jQuery("#execphp-2").show();
      jQuery(".login_logout ").css("width", "auto");
      jQuery(".login_logout ").css("justify-content", "start");
      jQuery(".login_logout ").css("padding-left", "0px");
      inputBox.focusout();
      isOpen = !1;
    }
  });
  submitIcon.mouseup(function () {
    return !1;
  });
  searchbar.mouseup(function () {
    return !1;
  });
  jQuery(document).mouseup(function () {
    if (isOpen == !0) {
      jQuery(".searchbar-icon").css("display", "block");
      submitIcon.click();
    }
  });
  jQuery(".navbar-toggler").click(function () {
    jQuery(".navbar-toggler").toggleClass("newheader-toggle");
  });
  jQuery("#custom-search-form").on("keyup keypress", function (e) {
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13) {
      e.preventDefault();
      return !1;
    }
  });
});


/* new js*/
/*
function(t) {
  t.stopPropagation(), t.preventDefault(), e.open ? e._resetMenu() : (e._openMenu(), document.addEventListener(e.eventtype, function(t) {
    e.open && !(function(e, t) {
      if (!e) return !1;
      for (var n = e.target || e.srcElement || e || !1; n && n.id != t;) n = n.parentNode || !1;
      return !1 !== n
    })(t.target, e.el.id) && n(this)
  }));
  if (e.open == !1) {
    jQuery('#mp-pusher .toogle-btn a#trigger').find('i').removeClass('fa-times').addClass('fa-bars')
  } else {
    jQuery('#mp-pusher .toogle-btn a#trigger').find('i').removeClass('fa-bars').addClass('fa-times')
  }
  console.log(e.open)
}
  */

