<?php

namespace App\Exceptions;

use Throwable;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Auth\Access\AuthorizationException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Throwable               $exception
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function render($request, Throwable $exception)
    {
        if ($request->is('api/*')) {
            if ($exception instanceof AuthenticationException) {
                try {
                    JWTAuth::parseToken()->authenticate();
                } catch (TokenExpiredException $e) {
                    return responseErrorMessage('رمز التحقق اصبح غير صالح', 401);
                } catch (TokenInvalidException $e) {
                    return responseErrorMessage('رمز التحقق غير صالح', 401);
                } catch (JWTException $e) {
                    return responseErrorMessage('خطا في رمز التحقق', 401);
                } catch (Throwable $e) {
                    return responseErrorMessage('خطا في رمز التحقق', 401);
                }

                return responseErrorMessage('الرجاء قم بتسجيل الدخول', 401);
            }

            if ($exception instanceof MethodNotAllowedHttpException) {
                return responseErrorMessage($exception->getMessage(), 500);
            }

            if ($exception instanceof NotFoundHttpException) {
                return responseErrorMessage('هذا الرابط ليس مودجود', 404);
            }

            if ($exception instanceof ModelNotFoundException) {
                return responseErrorMessage('هذا العنصر ليس موجود', 404);
            }

            if ($exception instanceof AuthorizationException) {
                return responseErrorMessage('ليس لديك حق الوصول', 403);
            }

            if (app()->environment() != 'local') {
                if ($exception instanceof Throwable) {
                    return responseErrorMessage($exception->getMessage(), 500);
                }
            }
        }

        return parent::render($request, $exception);
    }
}
