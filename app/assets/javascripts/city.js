$(() => {
  cityClickHandlers();
})

const cityClickHandlers = () => {
  $('.all_cities').on('click', (event) => {
    event.preventDefault();
//    history.pushState(null, null, 'cities');
//    fetch('/cities.json')
//      .then(response => response.json())
//      .then(cities => {
//        $('#app-container').html('');
//        cities.forEach(city => {
//          let newCity = new City(city);
//          let cityHtml = newCity.formatIndex();
//          $('#app-container').append(cityHtml);
//        })
//      })
  })

  $(document).on('click', '.show-city-link', function(event) {
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

  $(document).on('click', '.js-next-city', (event) => {
    event.preventDefault()
    let id = $(this).attr('data-id')
    console.log(id)
//    fetch(`cities/${id}/next`)
  })

  $(document).on('click', '.js-previous-city', (event) => {
    event.preventDefault()
    let id = $(this).attr('data-id')
    console.log(id)
  })
}

function City(object) {
  this.id = object.id;
  this.name = object.name;
  this.country = object.country;
}

City.prototype.formatIndex = function() {
  let cityHtml = `<li>
    <a href="/cities/${this.id}" data-id="${this.id}" class="show-city-link"><strong>${this.name}</strong></a>,
    ${this.country.name}
    </li>
  `;
  return cityHtml;
}

City.prototype.formatShow = function() {
  let cityHtml = `
    <button class="js-previous-city">Previous City</button>
    <br>
    <h2>${this.name}</h2>
    <button class="js-next-city" data-id="${this.id}>Next City</button>
    <br><br>
  `;
  return cityHtml;
}
