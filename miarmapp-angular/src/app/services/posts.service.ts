import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { PostsResponse } from '../models/interfaces/posts.interface';

var token= localStorage.getItem('request_token');

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Authorizarion': `Bearer ${token}`
  })
};

@Injectable({
  providedIn: 'root'
})
export class PostsService {

  constructor(private http: HttpClient) {}

    setLocalRequestToken(token: string) {
      localStorage.setItem('request_token', token);
    }

    getLocalRequestToken() {
      return localStorage.getItem('request_token');
    }

    getListPosts(): Observable < PostsResponse > {
      console.log(token)
      return this.http.get<PostsResponse>(`${environment.apiBaseUrl}/post/public`, DEFAULT_HEADERS);
    
  }
}
