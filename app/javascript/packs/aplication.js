// app/javascript/packs/application.js
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Add this line to confirm Rails UJS is loaded
console.log("Rails UJS Loaded:", Rails)

Rails.start()
Turbolinks.start()
ActiveStorage.start()
