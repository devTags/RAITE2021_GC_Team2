import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from './services/data.service';
import { UserService } from './services/user.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'seafarer';

  constructor(
    public _user: UserService,
    private _route: Router,
    public _ds: DataService
  ) {
    console.log(this._user.isLoggedIn());
  }
}
