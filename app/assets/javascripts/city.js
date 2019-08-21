$(() => {
  bindClickHandlers();
})

const bindClickHandlers = () => {
  $('.all_cities').on('click', (event) => {
    event.preventDefault();
    history.pushState(null, null, 'cities');
    fetch('/cities.json')
      .then(response => response.json())
      .then(cities => {
        $('#app-container').html('');
        cities.forEach(city => {
          let newCity = new City(city);
          let cityHtml = newCity.formatIndex();
          $('#app-container').append(cityHtml);
        })
      })
  })

  $(document).on('click', '.show-link', function(event) {
    event.preventDefault();
    let id = $(this).attr('data-id')
    history.pushState(null, null, `cities/${id}`);
    fetch(`/cities/${id}.json`)
      .then(response => response.json())
      .then(city => {
        $('#app-container').html('');
        let newCity = new City(city);
        let cityHtml = newCity.formatShow();
        $('#app-container').append(cityHtml);
      })
  })

  $(document).on('click', '.js-next', (event) => {
    let id = $(this).attr('data-id')
    fetch(`cities/${id}/next`)
  })
}

function City(object) {
  this.id = object.id;
  this.name = object.name;
  this.country = object.country;
}

City.prototype.formatIndex = function() {
  let cityHtml = `<li>
    <a href="/cities/${this.id}" data-id="${this.id}" class="show-link"><strong>${this.name}</strong></a>,
    ${this.country.name}
    </li>
  `;
  return cityHtml;
}

City.prototype.formatShow = function() {
  let cityHtml = `
    <h4>${this.name}</h4>
    <button class="js-next">Next City</button>
  `;
  return cityHtml;
}
