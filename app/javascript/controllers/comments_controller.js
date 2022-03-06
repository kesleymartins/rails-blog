import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
  }

  connect() {
  }

  toggleForm(event) {
    event.preventDefault()
    event.stopPropagation()

    const formId = event.params['form']
    const commentBodyId = event.params['body']
    const editBtnId = event.params['editBtn']

    const form = document.getElementById(formId)
    const commentBody = document.getElementById(commentBodyId)
    const editBtn = document.getElementById(editBtnId)

    form.classList.toggle('d-none')
    commentBody.classList.toggle('d-none')

    this.toggleEditButton(editBtn)
  }

  toggleEditButton(editButton) {
    editButton.innerText = editButton.innerText === 'Edit' ? 'Cancel' : 'Edit'

    this.toggleEditButtonClass(editButton)
  }

  toggleEditButtonClass(editButton) {
    editButton.classList.toggle('btn-warning')
    editButton.classList.toggle('btn-secondary')
  }
}
