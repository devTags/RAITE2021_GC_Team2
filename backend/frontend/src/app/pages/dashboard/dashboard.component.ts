import { Component, OnInit } from '@angular/core';
import { Chart, registerables } from 'node_modules/chart.js';
// import { Chart, registerables } from 'chart.js';
Chart.register(...registerables);
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
})
export class DashboardComponent implements OnInit {
  constructor() {}

  async ngOnInit(): Promise<void> {
    var myChart = await new Chart('myChart', {
      type: 'bar',
      data: {
        labels: ['Client', 'Doctor'],
        datasets: [
          {
            label: 'Accounts Chart',
            data: [2, 3],
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(75, 192, 192, 0.2)',
            ],
            borderColor: ['rgba(255, 99, 132, 0.2)', 'rgba(75, 192, 192, 0.2)'],
            borderWidth: 1,
          },
        ],
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    });

    var myChart2 = await new Chart('myChart2', {
      type: 'bar',
      data: {
        labels: ['Client', 'Doctor'],
        datasets: [
          {
            label: 'Accounts Chart',
            data: [2, 3],
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(75, 192, 192, 0.2)',
            ],
            borderColor: ['rgba(255, 99, 132, 0.2)', 'rgba(75, 192, 192, 0.2)'],
            borderWidth: 1,
          },
        ],
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    });
  }
}
