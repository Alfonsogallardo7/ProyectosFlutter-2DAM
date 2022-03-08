import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { PostsResponse } from '../models/interfaces/posts.interface';

var token= localStorage.getItem('token');
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
    getLocalSessionId() {
      return localStorage.getItem('session_id');
    }

    isLoggedIn(): boolean {
      return localStorage.getItem('session_id') != null;
    }

    setLocalSessionId(sessionId: string) {
      localStorage.setItem('session_id', sessionId);
    }

    setLocalRequestToken(token: string) {
      localStorage.setItem('request_token', token);
    }

    getLocalRequestToken() {
      return localStorage.getItem('request_token');
    }

    getListPosts(): Observable < PostsResponse > {
      return this.http.get<PostsResponse>(`${environment.apiBaseUrl}/post/public`, DEFAULT_HEADERS);
    
  }
}
