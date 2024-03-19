import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["cards", "shelves", "cardsButton", "shelvesButton"];

  connect() {
    // Показываем сад по умолчанию
    this.showGarden();
  }

  showGarden() {
    this.shelvesButtonTarget.classList.remove("active");
    this.cardsButtonTarget.classList.add("active");
    this.shelvesTarget.classList.add("hidden");
    this.cardsTarget.classList.remove("hidden");
  }

  showShelves() {
    this.cardsButtonTarget.classList.remove("active");
    this.shelvesButtonTarget.classList.add("active");
    this.cardsTarget.classList.add("hidden");
    this.shelvesTarget.classList.remove("hidden");
  }

}
