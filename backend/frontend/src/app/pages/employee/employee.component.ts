import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.scss'],
})
export class EmployeeComponent implements OnInit {
  sendfile: FormGroup;

  constructor(private fb: FormBuilder) {
    this.sendfile = this.fb.group({
      email: ['', Validators.required],
      reportfile: ['', Validators.required],

      newfile: ['', Validators.required],
    });
  }

  ngOnInit(): void {}

  submit(e: any) {
    e.preventDefault();
  }

  async submitPdf(event: any) {
    var formData = new FormData();
  }

  onFileChange(event: any) {
    if (event.target.files.length > 0) {
      const reportfile = event.target.files[0];
      console.log(reportfile);
      this.sendfile.patchValue({
        newfile: reportfile,
      });
    }
  }
}
