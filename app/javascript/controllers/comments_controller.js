import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
  connect() {}
  toggleForm() {
    console.log('edit buttos was clicked!')
  }
}
