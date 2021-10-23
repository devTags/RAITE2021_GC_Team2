import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/services/data.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  constructor(
    private _route: Router,
    private _user: UserService,
    private _data: DataService
  ) {}

  ngOnInit(): void {}

  public login(e: any) {
    e.preventDefault();
    let username = e.target[0].value;
    let password = e.target[1].value;

    this._data
      .processData('login', { username, password })
      .subscribe((res: any) => {
        try {
          if (res.status.remarks == 'success') {
            alert(res.status.message);
            this.navTo('dashboard');

            this._user.setLoggedIn();
          } else {
            alert(res.status.message);
          }
        } catch (err) {
          console.log('Invalid inputs');
        }
      });
  }

  public navTo(loc: string) {
    this._route.navigate(['/' + loc]);
  }
}
