import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["postContainer", "newPost", "newPostForm", "newButton"]

  newPostForm(event) {
    let response = event.detail[2].response
    this.newPostTarget.innerHTML += response
    this.newButtonTarget.hidden = true
  }

  hideForm() {
    this.newButtonTarget.hidden = false
    this.newPostFormTarget.remove()
  }

  prependPost(event) {
    let response = JSON.parse(event.detail[2].response)
    let link = document.createElement("a")

    link.setAttribute("href", `/posts/${response.id}`)
    link.classList.add("d-block")
    link.innerHTML = `${response.title}`

    this.postContainerTarget.prepend(link)
    this.newPostFormTarget.remove()
    this.newButtonTarget.hidden = false
  }
}
