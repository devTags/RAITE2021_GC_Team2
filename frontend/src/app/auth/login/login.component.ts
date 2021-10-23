import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  constructor(private _route: Router, private _user: UserService) {}

  ngOnInit(): void {}

  public login(e: any) {
    e.preventDefault();
    let param1 = e.target[0].value;
    let param2 = e.target[1].value;

    this.navTo('dashboard');
    this._user.setLoggedIn();
  }

  public navTo(loc: string) {
    this._route.navigate(['/' + loc]);
  }
}
