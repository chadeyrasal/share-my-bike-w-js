$(() => {
  bindClickHandlers();
})

const bindClickHandlers = () => {
  $('.city_bicycles').on('click', (event) => {
    event.preventDefault();
    console.log(fetch(`/bicycles.json`))
  })
}
