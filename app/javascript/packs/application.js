// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("local-time").start();

window.Rails = Rails;

import "bootstrap";
import "data-confirm-modal";
import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import App from '../app.vue'

Vue.use(Vuex)

window.store = new Vuex.Store({
  state: {
    lists: []
  },

  mutations: {
    addList(state, data) {
      state.lists.push(data)
    },
    addCard(state, data) {
      const index = state.lists.findIndex(item => item.id == data.list_id)
      state.lists[index].cards.push(data)
    },
    editCard(state, data) {
      const list_index = state.lists.findIndex((item) => item.id == data.list_id)
      const card_index = state.lists[list_index].cards.findIndex((item) => item.id == data.id)
      state.lists[list_index].cards.splice(card_index, 1, data)
    },
  }
})

$(document).on("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
  // draggable lists
  var element = document.querySelector("#boards")
  if (element != undefined ) {
    window.store.state.lists = JSON.parse(element.dataset.lists)

    const app = new Vue({
      el: element,
      store: window.store,
      template: "<App />",
      components: { App }
    })
  }
});

require("trix");
require("@rails/actiontext");
import "controllers";

// Start uppy
const Uppy = require("@uppy/core");
const Dashboard = require("@uppy/dashboard");
const ActiveStorageUpload = require("@excid3/uppy-activestorage-upload");

require("@uppy/core/dist/style.css");
require("@uppy/dashboard/dist/style.css");

document.addEventListener("turbolinks:load", () => {
  document
    .querySelectorAll("[data-uppy]")
    .forEach((element) => setupUppy(element));
});

function setupUppy(element) {
  let trigger = element.querySelector('[data-behavior="uppy-trigger"]');
  let form = element.closest("form");
  let direct_upload_url = document
    .querySelector("meta[name='direct-upload-url']")
    .getAttribute("content");
  let field_name = element.dataset.uppy;

  trigger.addEventListener("click", (event) => event.preventDefault());

  let uppy = Uppy({
    autoProceed: true,
    allowMultipleUploads: false,
    logger: Uppy.debugLogger,
  });

  uppy.use(ActiveStorageUpload, {
    directUploadUrl: direct_upload_url,
  });

  uppy.use(Dashboard, {
    trigger: trigger,
    closeAfterFinish: true,
  });

  uppy.on("complete", (result) => {
    // console.log(result);

    element
      .querySelectorAll("[data-pending-upload]")
      .forEach((element) => element.parentNode.removeChild(element));
    result.successful.forEach((file) => {
      appendUploadedFile(element, file, field_name);
      setPreview(element, file);
    });

    uppy.reset();
  });
}

function appendUploadedFile(element, file, field_name) {
  const hiddenField = document.createElement("input");

  hiddenField.setAttribute("type", "hidden");
  hiddenField.setAttribute("name", field_name);
  hiddenField.setAttribute("data-pending-upload", true);
  hiddenField.setAttribute("value", file.response.signed_id);

  element.appendChild(hiddenField);
}

function setPreview(element, file) {
  let preview = element.querySelector('[data-behavior="uppy-preview"]');
  if (preview) {
    preview.src = file.preview;
  }
}
// finish Uppy

// start select2 https://yarnpkg.com/package/select2
import select2 from "select2";
import "select2/dist/css/select2.css";

$(document).ready(function() {
  $("select").select2();
});
// finish select2

import "controllers";
