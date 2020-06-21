import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["container", "newButton", "newCommentForm", "commentList"]

  newComment(event) {
    let response = event.detail[2].response
    let container = this.containerTarget
    this.newButtonTarget.hidden = true
    container.innerHTML += response
  }

  hideForm(){
    this.newCommentFormTarget.remove()
    this.newButtonTarget.hidden = false
  }

  prependComment(event){
    let response = JSON.parse(event.detail[2].response)
    let para = document.createElement("p")
    para.innerHTML = response.body
    this.commentListTarget.prepend(para)
    this.newCommentFormTarget.remove()
    this.newButtonTarget.hidden = false
  }
}