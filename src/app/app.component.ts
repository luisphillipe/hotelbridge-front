import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { LoginComponent } from './pages/login/login.component'; // Certifique-se de que o caminho está correto


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, LoginComponent],
  template: `<app-login></app-login>`, // Renderizando o LoginComponent aqui

 // templateUrl: './app.component.html',
 // styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'hotelbridge-frontend';
}
