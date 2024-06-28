class Post {
  constructor(userId, title, body) {
    this.name = this.getNameFromUserId(userId);
    this.title = title;
    this.body = body;
  }

  getNameFromUserId(userId) {
    const Names = {
      1: "Athota Srilatha",
      2: "Bandaru Sampath Kumar",
      3: "Gollakaram Ganga Bhavani",
      4: "Gowtham Meka",
      5: "Mayuraj Ranawat",
      6: "Narendiran K",
      7: "Pratham Madhunapanthula",
      8: "Riya Reddy",
      9: "Shaik Sameer",
      10: "Suriyan K",
      11: "Vaishnavi Panta",
      12: "Yateesh Tangudu",
    };
    return Names[userId];
  }
}

document.getElementById("update-data").addEventListener("click", loadData);
var posts;
function loadData() {
  fetch("https://jsonplaceholder.typicode.com/posts")
    .then((response) => response.json())
    .then((data) => {
      console.log("API sent response");
      console.log(data);
      posts = data.map(
        (postData) => new Post(postData.userId, postData.title, postData.body)
      );
      updateTable(posts);
    })
    .catch((error) => console.error("Error fetching data:", error));
}

function updateTable(posts) {
  const tableBody = document.querySelector("#posts-table tbody");
  tableBody.innerHTML = "";
  setTimeout(
    posts.forEach((post) => {
      const row = document.createElement("tr");
      const nameCell = document.createElement("td");
      const titleCell = document.createElement("td");
      const bodyCell = document.createElement("td");

      nameCell.textContent = post.name;
      titleCell.textContent = post.title;
      bodyCell.textContent = post.body;

      row.appendChild(nameCell);
      row.appendChild(titleCell);
      row.appendChild(bodyCell);
      tableBody.appendChild(row);
    }),
    1000
  );
}
const searchInput = document.getElementById("searchInput");
searchInput.addEventListener("input", () => {
  const searchTerm = searchInput.value.trim().toLowerCase();

  if (searchTerm) {
    const filteredPosts = posts.filter((post) =>
      post.name.toLowerCase().includes(searchTerm)
    );
    updateTable(filteredPosts);
  } else {
    updateTable(posts);
  }
});

loadData();
