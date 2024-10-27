function generateNumbers() {
  const numbersContainer = document.getElementById("numbers-container");
  const numberDivs = numbersContainer.getElementsByClassName(
    "flex items-center justify-center",
  );

  // Function to generate a random number between min and max (inclusive)
  function generateRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  // Generate and sort the first 6 numbers between 1 and 37
  const firstSixNumbers = [];
  for (let i = 0; i < 6; i++) {
    firstSixNumbers.push(generateRandomNumber(1, 37));
  }
  firstSixNumbers.sort((a, b) => a - b);

  // Update the first 6 divs with sorted numbers
  for (let i = 0; i < 6; i++) {
    numberDivs[i].textContent = firstSixNumbers[i];
  }

  // Update the 7th div with a number between 1 and 7
  numberDivs[6].textContent = generateRandomNumber(1, 7);
}

document.addEventListener("DOMContentLoaded", function () {
  document
    .getElementById("refreshButton")
    .addEventListener("click", generateNumbers);
  generateNumbers();
});
