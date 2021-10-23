import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DataService } from 'src/app/services/data.service';

@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.scss'],
})
export class EmployeeComponent implements OnInit {
  sendfile: FormGroup;

  constructor(private fb: FormBuilder, private _data: DataService) {
    this.sendfile = this.fb.group({
      fname: ['', Validators.required],
      mname: ['', Validators.required],
      lname: ['', Validators.required],
      newfile: ['', Validators.required],
      rank: ['', Validators.required],
    });
  }

  ngOnInit(): void {}

  submit(e: any) {
    e.preventDefault();
    console.log(this.sendfile.value);

    // var formData = new FormData()
    // formData.append('attachment', this.sendfile.get('newfile').value)
    // console.log(this.sendfile.get('newfile').value);

    this._data
      .processData('insert_crew', this.sendfile.value)
      .subscribe((res: any) => {
        try {
          console.log(res);
        } catch (err) {
          console.log('Invalid inputs');
        }
      });
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
