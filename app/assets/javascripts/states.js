$('document').ready(function() {
  alert("It's loaded!");
  alert($('#safest-states-chart-area').data('full_name'));

//   var stateNames = [];
//   var stateAbbreviations = [];
//   var stateMilitaryPop = [];
//   var statePop = [];
//   var stateHousingTotal = [];
//   var stateHousingOccupied = [];
//   var stateHousingVacant = [];

//   for (var state in @safestPlaces) {
//     stateNames.push(@safestPlaces['full_name']);
//     stateAbbreviations.push(@safestPlaces['abr']);
//     stateMilitaryPop.push(@safestPlaces[]);
//     // statePop.push(<%= sound.favoritings_count %>);
//     // stateHousingTotal.push(<%= sound.comment_count %>);
//     // stateHousingOccupied.push(<%= sound.playback_count %>);
//     // stateHousingVacant.push(<%= sound.playback_count %>);
//   }

//   var longestBarChartData = {
//     labels : trackLabels,
//     datasets : [
//       {
//         label: "Title Length",
//         fillColor: "rgba(255,106,0,0.5)",
//         strokeColor : "rgba(220,220,220,0.8)",
//         highlightFill: "rgba(212,118,51,0.75)",
//         highlightStroke: "rgba(220,220,220,1)",
//         // data: trackTitleLengths
//       }
//     ]
//   }

//   var popularityBarChartData = {
//     labels : trackLabels,
//     datasets : [
//       {
//         label: "Downloads",
//         fillColor: "rgba(255,106,0,0.5)",
//         strokeColor : "rgba(220,220,220,0.8)",
//         highlightFill: "rgba(212,118,51,0.75)",
//         highlightStroke: "rgba(220,220,220,1)",
//         // data: trackDownloads
//       },
//       {
//         label: "Favoritings",
//         fillColor: "rgba(151,187,205,0.5)",
//         strokeColor : "rgba(151,187,205,0.8)",
//         highlightFill : "rgba(151,187,205,0.75)",
//         highlightStroke : "rgba(151,187,205,1)",
//         // data: trackFavoritings
//       },
//       {
//         label: "Comments",
//         fillColor: "rgba(151,187,205,0.5)",
//         strokeColor : "rgba(151,187,205,0.8)",
//         highlightFill : "rgba(151,187,205,0.75)",
//         highlightStroke : "rgba(151,187,205,1)",
//         // data: trackComments
//       },
//       {
//         label: "Plays",
//         fillColor: "rgba(151,187,205,0.5)",
//         strokeColor : "rgba(151,187,205,0.8)",
//         highlightFill : "rgba(151,187,205,0.75)",
//         highlightStroke : "rgba(151,187,205,1)",
//         // data: trackPlays
//       }
//     ]
//   }

//   window.onload = function(){
//     var ctx = document.getElementById("longest-titles-chart-area").getContext("2d");
//     window.longestBarChart = new Chart(ctx).Bar(longestBarChartData, {
//       responsive : true,
//       multiTooltipTemplate: "Title: <%%= datasetLabel %> | Length: <%%= value %>"
//     });

//     var ctx = document.getElementById("popularity-chart-area").getContext("2d");
//     window.popularityBarChart = new Chart(ctx).Bar(popularityBarChartData, {
//       responsive : true,
//       multiTooltipTemplate: "<%%= datasetLabel %>: <%%= value %>"
//     });
//   }
});