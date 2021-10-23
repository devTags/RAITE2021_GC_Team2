import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  apiLink: string | undefined;
  genHexString(arg0: number) {
    throw new Error('Method not implemented.');
  }
  public loggedIn: boolean;

  constructor() {
    this.loggedIn = false;
  }

  ngOnit() {}

  setLoggedIn() {
    // window.sessionStorage.setItem('login', 'true');
    this.loggedIn = true;
  }

  setLoggedOut() {
    // window.sessionStorage.setItem('login', 'false');
    this.loggedIn = false;
  }

  isLoggedIn() {
    return this.loggedIn;
  }
}
