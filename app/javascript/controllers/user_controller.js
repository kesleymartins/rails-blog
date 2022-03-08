import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
  connect() {}

  togglePosts(event) {
    event.preventDefault()
    event.stopPropagation()

    const postsTabID = event.params['postsTab']
    const commentsTabID = event.params['commentsTab']
    const userPostsID = event.params['userPosts']
    const userCommentsID = event.params['userComments']

    const postsTab = document.getElementById(postsTabID)
    const commentsTab = document.getElementById(commentsTabID)
    const userPosts = document.getElementById(userPostsID)
    const userComments = document.getElementById(userCommentsID)


    if (commentsTab.classList.contains('active')) {
      postsTab.classList.add('active')
      commentsTab.classList.remove('active')

      userPosts.classList.toggle('d-none')
      userComments.classList.toggle('d-none')
    }
  }

  toggleComments(event) {
    event.preventDefault()
    event.stopPropagation()

    const postsTabID = event.params['postsTab']
    const commentsTabID = event.params['commentsTab']
    const userPostsID = event.params['userPosts']
    const userCommentsID = event.params['userComments']

    const postsTab = document.getElementById(postsTabID)
    const commentsTab = document.getElementById(commentsTabID)
    const userPosts = document.getElementById(userPostsID)
    const userComments = document.getElementById(userCommentsID)

    if (postsTab.classList.contains('active')) {
      commentsTab.classList.add('active')
      postsTab.classList.remove('active')

      userPosts.classList.toggle('d-none')
      userComments.classList.toggle('d-none')
    }
  }
}
