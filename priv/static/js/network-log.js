function initNetworkLog() {
  const container = document.createElement("div");
  container.id = "network-log";
  container.style.cssText = `
          position: fixed;
          bottom: 0;
          left: 0;
          width: 100%;
          height: 150px;
          background-color: rgba(0, 0, 0, 0.8);
          color: #fff;
          font-family: monospace;
          font-size: 12px;
          overflow-y: auto;
          z-index: 9999;
        `;
  document.body.appendChild(container);

  // Create an observer instance to watch for new network entries
  const observer = new PerformanceObserver((list) => {
    list.getEntries().forEach((entry) => {
      if (entry.entryType === "resource") {
        addLogEntry(entry);
      }
    });
  });

  // Capture initial page load resources
  performance.getEntriesByType("resource").forEach(addLogEntry);

  // Start observing
  observer.observe({ entryTypes: ["resource"] });

  // Function to add a new log entry
  function addLogEntry(entry) {
    const logEntry = document.createElement("div");
    logEntry.style.cssText = `
            padding: 5px;
            border-bottom: 1px solid #444;
          `;

    const method = entry.initiatorType === "fetch" ? "FETCH" : "GET";
    const status = entry.transferSize > 0 ? "200 OK" : "Cached";

    logEntry.innerHTML = `
            <span style='color: #4CAF50;'>${method}</span>
            <span style='color: #2196F3;'>${status}</span>
            <span style='color: #FFC107;'>${Math.round(entry.duration)}ms</span>
            <span style='color: #E91E63;'>${entry.name.split("/").pop()}</span>
          `;

    container.insertBefore(logEntry, container.firstChild);

    // Remove old entries if there are too many
    if (container.children.length > 100) {
      container.removeChild(container.lastChild);
    }
  }
  console.log(
    "Network monitor initialized. Check the bottom of the page for the log.",
  );
}

document.addEventListener("DOMContentLoaded", function (event) {
  initNetworkLog();
});
