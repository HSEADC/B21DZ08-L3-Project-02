import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["cards", "shelves"];

  connect() {
    // Показываем сад по умолчанию
    this.showGarden();
  }

  showGarden() {
    this.shelvesTarget.classList.add("hidden");
    this.cardsTarget.classList.remove("hidden");
  }

  showShelves() {
    this.cardsTarget.classList.add("hidden");
    this.shelvesTarget.classList.remove("hidden");
  }

}
