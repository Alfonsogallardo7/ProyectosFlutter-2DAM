import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Posts } from 'src/app/models/interfaces/posts.interface';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-post-item',
  templateUrl: './post-item.component.html',
  styleUrls: ['./post-item.component.css']
})
export class PostItemComponent implements OnInit {
  @Input() postsInput!: Posts;

  constructor(private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getPostImageUrl(post: Posts) {
    return `${post.fichero}`
  }

}
