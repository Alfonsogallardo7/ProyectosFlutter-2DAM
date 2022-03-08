import { Component, OnInit } from '@angular/core';
import { Posts } from 'src/app/models/interfaces/posts.interface';
import { PostsService } from 'src/app/services/posts.service';

@Component({
  selector: 'app-list-posts',
  templateUrl: './list-posts.component.html',
  styleUrls: ['./list-posts.component.css']
})
export class ListPostsComponent implements OnInit {

  listPosts: Posts[] = [];

  constructor(private postService: PostsService) { }

  ngOnInit(): void {
    this.postService.getListPosts().subscribe(resp => {
      this.listPosts = resp.content;
    })
  }

}
