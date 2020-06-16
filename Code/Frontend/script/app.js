const lanIP = `${window.location.hostname}:5000`;
const socketio = io(`http://${lanIP}`);
let html_data;
let knop_licht;
let chart;
let state;
let actuator;

const listen_to_socket = function(){
  socketio.on("B2F_sensor_data",function(waarde){
    document.querySelector(".js-waarde-temp").innerHTML = `${waarde.Temperatuur}°C`;
    if(waarde.Vochtigheid != null){
      document.querySelector(".js-waarde-lucht").innerHTML = `${waarde.Vochtigheid}%`;      
    };
    document.querySelector(".js-waarde-licht").innerHTML = `${waarde.LDR}%`;
    document.querySelector(".js-status-pomp").innerHTML = `${waarde.Pomp}`;
    document.querySelector(".js-waarde-grond").innerHTML = `${waarde.Grond}%`;
    document.querySelector(".js-status-licht").innerHTML = `${waarde.Licht}`;
    document.querySelector(".js-status-stepper").innerHTML = `${waarde.Stepper}`;
  });
};

const listen_to_UI = function () {
  document.querySelector(".button_licht").addEventListener("click", function () {
    socketio.emit("F2B_licht");
    console.log("Licht Aan")
  })
  document.querySelector(".button_licht_uit").addEventListener("click", function () {
    socketio.emit("F2B_licht_uit");
    console.log("Licht Uit")
  })
};

const show_data_actuator = function (jsonObject){
  let table = ``;
  table += `<tr> <th>Actie ID </th> <th>Actuator ID</th> <th>datum</th> <th>Status</th>`;
  for(let data of jsonObject){
    if (data.actuatorID == 1) {
      actuator = 'Pomp';
    } else if (data.actuatorID == 2) {
      actuator = 'Ledstrip'
    }

    if (data.status == 0){
      state = 'Uit'
    }
    else{
      state = 'Aan'
    }
    table += `<tr> <td>${data.actieID}</td>  <td>${actuator}</td>  <td>${data.datum}</td>  <td>${state}</td>`;
  };
  html_data_actuator.innerHTML = table;
};

const show_data = function(jsonObject) {
  let wegscrhijven = ``;
  showData_Chart(jsonObject);
  wegscrhijven += `<tr> <th>Meting ID </th> <th>waarde</th> <th>datum</th> <th>Sensor Naam</th>`;
  for(let data of jsonObject){
    if(data.sensorID != 3){
      wegscrhijven += `<tr> <td>${data.metingID}</td>  <td>${data.waarde}</td>  <td>${data.date}</td>  <td>${data.beschrijving}</td>  `;
    }
    else{
      if(data.waarde == 1){
        wegscrhijven += `<tr> <td>${data.metingID}</td>  <td>VOL</td>  <td>${data.date}</td>  <td>${data.beschrijving}</td>  `;         
      }
      else{
        wegscrhijven += `<tr> <td>${data.metingID}</td>  <td>LEEG</td>  <td>${data.date}</td>  <td>${data.beschrijving}</td>  `;               
      }
    }
  };
  html_data.innerHTML = wegscrhijven;
};


//CHART JS
function drawChart(labels, data) {
  chart.data.labels = labels;
  chart.data.datasets[0].data = data;
  chart.update();
}

function showData_Chart(data) {
  console.log(data)
  let converted_labels = [];
  let converted_data = [];
  for (let waarde of data){
      converted_labels.push(waarde.date);
      converted_data.push(waarde.waarde);
  }
  drawChart(converted_labels, converted_data);
}

//EINDE CHART JS

const retrieve_data = function(){
  handleData(`http://${window.location.host}:5000/`, show_data);
};

const retrieve_data_actuator = function(){
  handleData(`http://${window.location.host}:5000/actie`,show_data_actuator);
};

 const show_data_chart = function(id){
   if(id == 1){
    handleData(`http://${window.location.host}:5000/sensors/${id}`, showData_Chart);
   }
   else if(id == 2){
    handleData(`http://${window.location.host}:5000/sensors/${id}`, showData_Chart);
   }
}


 const update_chart = function(){
  if(chart == null){
    let ctx = document.getElementById('ChartTemp').getContext('2d');

    let config = {
        type: 'line',
        data: {
            labels: null,
            datasets: [
                {
                    label: "Temperatuur",
                    backgroundColor: "white",
                    borderColor: "red",
                    data: null,
                    fill: false
                }
            ]
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: ""
            },
            tooltips: {
                mode: "index",
                intersect: true
            },
            hover: {
                mode: "nearest",
                intersect: true
            },
            scales: {
                xAxes: [
                    {
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: "Datum"
                        }
                    }
                ],
                yAxes: [
                    {
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: "Waarde (°C)"
                        }
                    }
                ]
            }
        }
    };
  
     chart = new Chart(ctx, config);
  };
  showData_Chart();
}; 


document.addEventListener("DOMContentLoaded", function () {
  console.info("DOM geladen");
  html_data = document.querySelector('.js-data');
  html_data_actuator = document.querySelector('.js-data-actuator');
  knop_licht = document.querySelector('.button_licht');
  retrieve_data();
  retrieve_data_actuator();
  listen_to_UI();
  listen_to_socket();
  show_data_chart(2);
  update_chart();
});
