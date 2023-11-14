<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 알러트 모달


cns 입니다


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>


------------------------------------------

아래 스크립트 영역에서 사용 가능

Swal.fire({
				      icon: 'success',
				      title: 'Alert가 실행되었습니다.',
				      text: '이곳은 내용이 나타나는 곳입니다.',
				      confirmButtonColor: 'blue'
				    });
      
 -->








<!-- 입력 폼 모달 -->


<!-- data-bs-target에 모달 ID를 주어야함 -->
<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#error-modal">버튼</button>




<!-- 아이디를 버튼의 data-bs-target이랑 맞추어주어야 함 -->
<div class="modal fade" id="error-modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 500px">
    <div class="modal-content position-relative">
      <div class="position-absolute top-0 end-0 mt-2 me-2 z-1">
        <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-0">
        <div class="rounded-top-3 py-3 ps-4 pe-6" style="background-color: midnightblue">
          <h4 class="mb-1 text-white" id="modalExampleDemoLabel">Add a new illustration </h4>
        </div>
        <div class="p-4 pb-0">
          <form>
            <div class="mb-3">
              <label class="col-form-label" for="recipient-name">Recipient:</label>
              <input class="form-control" id="recipient-name" type="text" />
            </div>
            <div class="mb-3">
              <label class="col-form-label" for="message-text">Message:</label>
              <textarea class="form-control" id="message-text"></textarea>
            </div>
          </form>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
        <button class="btn btn-primary" type="button">Understood </button>
      </div>
    </div>
  </div>
</div>