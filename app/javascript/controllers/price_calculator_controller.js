import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calculator"
export default class extends Controller {
  static targets = ["startElement", "endElement", "daysElement", "totalElement"]
  static values = {dailyPrice: Number}

  connect() {
    console.log("connecting...")
    // console.log(this.endElementTarget.value);
    // console.log(this.startElementTarget.value);
  }

  calculate() {
    // console.log(this.endElementTarget.value);
    // console.log(this.startElementTarget.value);
    if (this.startElementTarget.value && this.endElementTarget.value) {

      const startDateValue = this.startElementTarget.value;
      const endDateValue = this.endElementTarget.value;

      const startDate = new Date(startDateValue);
      const endDate = new Date(endDateValue);

      const timeDiff = endDate - startDate;
      const dayCount = (timeDiff/1000/60/60/24) + 1
      this.daysElementTarget.innerText = dayCount

      this.totalElementTarget.innerText = dayCount * this.dailyPriceValue + 5
      console.log(this.dailyPriceValue)
    }
  }
}


// create function calculate, get start and end date (end - start)
// data value,  passing values from html to Sjs
