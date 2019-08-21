$(() => {
  bicycleClickHandlers();
})

const bicycleClickHandlers = () => {
  $('.city_bicycles').on('click', function(event) {
    event.preventDefault();
    let id = $(this).attr('data-id')
    history.pushState(null, null, `${id}/bicycles`);
    fetch(`bicycles.json`)
      .then(response => response.json())
      .then(bicycles => {
        $('#app-container').html('');
        bicycles.forEach((bicycle) => {
          let newBicycle = new Bicycle(bicycle);
          let bicycleHtml = newBicycle.formatIndex();
          $('#app-container').append(bicycleHtml);
        })
      })
  })
}

function Bicycle(object) {
  this.id = object.id;
  this.bicycle_type = object.bicycle_type;
  this.size = object.size;
  this.colour = object.colour;
  this.title = object.title;
  this.description = object.description;
  this.price = object.price;
  this.neighborhood = object.neighborhood;
  this.owner = object.owner;
  this.country = object.country;
  this.city = object.city;
}

Bicycle.prototype.formatIndex = function() {
  let bicycleHtml = `<li>
    <a href="/bicycles/${this.id}"><strong>${this.title}</strong></a>, ${this.price}
    <button>More Info</button>
    </li>
    <br>
  `;
  return bicycleHtml;
}
