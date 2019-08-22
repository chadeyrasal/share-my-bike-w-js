const baseUrl = 'http://localhost:3000/';

$(() => {
  allCitiesClick();
  cityClick();
  newBicycleSubmission();
});

const clearDom = () => {
  $('#app-container').html('');
};
