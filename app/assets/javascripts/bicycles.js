$(() => {
  bindClickHandlers();
})

const bindClickHandlers = () => {
  $('.city_bicycles').on('click', (event) => {
    event.preventDefault();
    history.pushState(null, null, 'bicycles');
    alert('hello there')
//    fetch(`/bicycles.json`)
//      .then(response => response.json())
//      .then(bicycles => {
//        $('#app-container').html('');
//        bicycles.forEach((bicycle) => {
//          let newBicycle = new Bicycle(bicyle);
//          let bicycleHtml = newBicycle.formatIndex();
//          $('#app-container').append(bicycleHtml);
//        })
//      })
  })
}

function Bicycle(id, bicycle_type, size, colour, title, desription, price, neighborhood, owner, country, city) {
  this.id = id;
  this.bicycle_type = bicycle_type;
  this.size = size;
  this.colour = colour;
  this.title = title;
  this.description = description;
  this.price = price;
  this.neighborhood = neighborhood;
  this.owner = owner;
  this.country = country;
  this.city = city;
}

Bicycle.prototype.formatIndex = function() {
  let bicycleHtml = `
    <a href="/bicycles/${this.id}"><h1>${this.title}</h1></a>
  `;
  return bicycleHtml;
}
