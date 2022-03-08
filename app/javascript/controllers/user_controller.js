import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
  connect() {}

  static targets = [ "userPosts", "userComments", "commentsTab", "postsTab" ]

  toggleTab(event) {
    event.preventDefault()

    if (event.target.classList.contains('active') == false) {
      this.userPostsTarget.classList.toggle('d-none')
      this.userCommentsTarget.classList.toggle('d-none')

      const commentsTabLink = this.commentsTabTarget.querySelector('a')
      const postsTabLink = this.postsTabTarget.querySelector('a')

      commentsTabLink.classList.toggle('active')
      postsTabLink.classList.toggle('active')
    }
  }
}
