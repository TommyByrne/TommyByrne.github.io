//= require_tree .

var HW = {
  toggleMobileMenu: function() {
    document.querySelector('.navigation').classList.toggle('open');
  },

  toggleContactForm: function() {
    document.querySelector('body').classList.toggle('contact-form-open');
  }
};

document.querySelector('#contact-form').onsubmit = function(event) {
  event.target.classList.add('submitted');
  event.target.parentNode.classList.add('child-form-submitted');
};

// Automatically expand textareas as you type
autosize(document.querySelectorAll('textarea'));
