import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AuthLoginResponse } from '../models/interfaces/auth.interface';
import { Observable } from 'rxjs';
import { AuthLoginDto } from '../models/dto/auth.dto';
import { environment } from 'src/environments/environment';

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
};
@Injectable({
  providedIn: 'root'
})
export class AuthService {
  authBaseUrl = `${environment.apiBaseUrl}`;
  constructor(private http: HttpClient) { }

  login (loginDto: AuthLoginDto): Observable<AuthLoginResponse> {
    let requestUrl = `${this.authBaseUrl}/auth/login`;
    return this.http.post<AuthLoginResponse>(requestUrl, loginDto, DEFAULT_HEADERS);
  }
}
