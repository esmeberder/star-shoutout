//= require rails-ujs
//= require_tree .
filters = document.querySelectorAll("#filter")

filters.forEach((filter)=>{
  filter.addEventListener("click", (event)=>{
    current = document.querySelector(".active")
    current.className=current.className.replace("active","")
    console.log(current)
    filter.classList.add("active")
  })
})
