var variable = 0;

function alertVariable() {
  alert(variable);
}

function incrementVariable() {
  url = "http://localhost:8080/Tests/TestPage/incrementVariable";
  fetch(url, {
    method: "GET" // default, so we can ignore
  }).then(function(response) {
    alert(response.json());
  });
}