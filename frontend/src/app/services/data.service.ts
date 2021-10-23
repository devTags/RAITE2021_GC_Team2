import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { DefaultImage } from '../data-schema';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  private keyString = new DefaultImage();
  private apiLink = 'http://localhost/backend/';
  constructor(private _http: HttpClient, private _user: UserService) {
    console.log('data service is working');
  }
  public processData(endpoint: any, data: any) {
    return this._http.post(this.apiLink + endpoint, JSON.stringify(data));
  }
}
