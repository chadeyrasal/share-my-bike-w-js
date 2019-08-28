const newBicycleSubmission = () => {
  $('.new_bicycle').on('submit', function(event) {
    event.preventDefault();
    const values = $(this).serialize();
    let userId = $('.bicycle-user-id').data('bicycle-user-id')
    let postUrl = baseUrl + 'users/' + userId + '/bicycles'
    $.post(postUrl, values).done(function(data) {
      clearDom();
      const newBicycle = new Bicycle(data);
      const bicycleHtml = newBicycle.formatShow();
      $('#app-container').append(bicycleHtml);
    });
  });
};

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
    <a href="/bicycles/${this.id}"><strong>${this.title}</strong></a><br>
    Type: ${this.bicycle_type}<br>
    Price: ${this.price}<br>
    Location: ${this.neighborhood.name} (${this.city.name}, ${this.country.name})
    </li>
    <br>
  `;
  return bicycleHtml;
}

Bicycle.prototype.formatShow = function() {
  let bicycleHtml = `
  <h4>${this.title}</h4>
  <p>${this.description}</p>
  <p>Type: ${this.bicycle_type}</p>
  <p>Size: ${this.size}</p>
  <p>Colour: ${this.colour}</p>
  <p>Price: ${this.price}</p>
  <p>Location: ${this.neighborhood.name}, ${this.city.name}, ${this.country.name}</p>
  `;

  return bicycleHtml;
};
