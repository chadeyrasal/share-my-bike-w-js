const allCitiesClick = () => {
  $('.all_cities').on('click', (event) => {
    event.preventDefault();
    let url = baseUrl + 'cities'
    history.pushState(null, null, url);
    getCities();
  });
};

const getCities = () => {
  fetch('/cities.json')
    .then(response => response.json())
    .then(cities => {
      clearDom();
      cities.forEach(city => {
        let newCity = new City(city);
        let cityHtml = newCity.formatIndex();
        $('#app-container').append(cityHtml);
      });
    });
};

const cityClick = () => {
  $(document).on('click', '.show-city-link', function(event) {
    event.preventDefault();
    clearDom();
    let id = $(this).attr('data-id');
    let url = baseUrl + 'cities/' + id;
    history.pushState(null, null, url);
    fetch(`/cities/${id}.json`)
      .then(response => response.json())
      .then(city => {
        getCity(city);
        getCityBicycles(city);
      });
  });
};

const getCity = (city) => {
  let newCity = new City(city);
  let cityHtml = newCity.formatShow();
  $('#app-container').append(cityHtml);
}

const getCityBicycles = (city) => {
  let cityBicycles = city.bicycles;
  cityBicycles.forEach(bicycle => {
    let newBicycle = new Bicycle(bicycle);
    let bicycleHtml = newBicycle.formatIndex();
    $('#app-container').append(bicycleHtml);
  });
};

function City(object) {
  this.id = object.id;
  this.name = object.name;
  this.country = object.country;
};

City.prototype.formatIndex = function() {
  let cityHtml = `<li>
    <a href="/cities/${this.id}" data-id="${this.id}" class="show-city-link"><strong>${this.name}</strong></a>,
    ${this.country.name}
    </li>
  `;
  return cityHtml;
};

City.prototype.formatShow = function() {
  let cityHtml = `
    <h2>${this.name}</h2>
    <h3>${this.country.name}</h3>
    <h4>A selection of bicycles in the city: </h4>
  `;
  return cityHtml;
};
