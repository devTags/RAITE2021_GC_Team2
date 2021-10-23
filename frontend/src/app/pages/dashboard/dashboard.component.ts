import { Component, OnInit } from '@angular/core';
import { Chart, registerables } from 'node_modules/chart.js';
import { DataService } from 'src/app/services/data.service';
// import { Chart, registerables } from 'chart.js';
Chart.register(...registerables);
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
})
export class DashboardComponent implements OnInit {
  p: number = 1;
  crews: any;

  constructor(private _data: DataService) {}

  async ngOnInit(): Promise<void> {
    this.loadCrew();
    var myChart = await new Chart('myChart', {
      type: 'bar',
      data: {
        labels: ['Client', 'Doctor'],
        datasets: [
          {
            label: 'Accounts Chart',
            data: [2, 3],
            backgroundColor: [
              'rgba(78, 100, 103, 0.2)',
              'rgba(152, 193, 248, 0.2)',
            ],
            borderColor: [
              'rgba(78, 100, 103, 0.2)',
              'rgba(152, 193, 248, 0.2)',
            ],
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
      type: 'doughnut',
      data: {
        labels: ['Waiting', 'Ongoing', 'Delivered'],
        datasets: [
          {
            label: 'My First Dataset',
            data: [300, 50, 100],
            backgroundColor: [
              'rgba(84, 137, 150, 0.2)',
              'rgba(7, 140, 154, 0.2)',
              'rgba(222, 237, 253, 0.2)',
            ],
            hoverOffset: 4,
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

  loadCrew() {
    console.log('load');
    this._data.processData('get_crew', null).subscribe((res: any) => {
      try {
        if (res) {
          console.log(res.data);
          this.crews = res.data;
        }
      } catch (err) {
        console.log('Invalid inputs');
      }
    });
  }
}
