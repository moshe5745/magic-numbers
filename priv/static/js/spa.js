async function fetchNumbers() {
  const numbersContainer = document.getElementById("numbers-container");
  const numberDivs = numbersContainer.getElementsByClassName(
    "flex items-center justify-center",
  );

  try {
    // Fetch the numbers from the API
    const response = await fetch("/api/numbers");
    const data = await response.json();

    const regularNumbers = data.regular_numbers; // Array of 6 numbers
    const strongNumber = data.strong_number; // 1 number

    // Populate the first 6 divs with the regular numbers
    regularNumbers.forEach((num, index) => {
      numberDivs[index].textContent = num;
    });

    // Populate the 7th div with the strong number
    numberDivs[6].textContent = strongNumber;
  } catch (error) {
    console.error("Error fetching numbers:", error);
  }
}

document.addEventListener("DOMContentLoaded", function (event) {
  document
    .getElementById("refreshButton")
    .addEventListener("click", fetchNumbers);
  fetchNumbers();
});
