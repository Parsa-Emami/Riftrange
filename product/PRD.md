# RiftRange product requirements v0

Status: planning; application source not implemented. English-facing app/docs are the release default. See Persian assessment for commercial hypotheses.

Target user: مدرس امنیت و توسعه‌دهندهٔ آزمایشگاه محلی

Job to complete: ساخت و پاک‌سازی یک تمرین ایزوله با نتیجهٔ قابل‌بازتولید

Differentiation hypothesis: آزمایشگاه کوتاه برای امنیت برنامه، با سناریوهای declarative و گزارش آموزشی

## MVP acceptance scope

- یک host محلی و یک template ثابت
- سناریوی شبیه‌سازی محدود و allowlist
- start/stop/status و lease
- نمایش نتیجه و گزارش قابل‌حمل

## Excluded until another decision

- اجرای عمومی کد کاربران
- fleet چند host
- Firecracker برای مرز اطمینان بالاتر
- billing و بازار content pack

## End-to-end outcomes

1. یک template ثابت را راه‌اندازی و stop کن؛ container/network/mount اضافه باقی نماند
2. orchestrator وسط provisioning کشته شود؛ restart به حالت صحیح برسد
3. سناریو اجازهٔ shell دلخواه، mount میزبان و هدف اینترنتی ندهد

Functional requirements F01–F20 and nonfunctional/release requirements are mapped one-to-one in `plans/requirements.json`. Tests belong with their feature commit, not postponed until launch. Success: a clean installed selected profile performs the core task and recovers from documented failures. Public demand remains unvalidated until real trials are recorded.

## UI flow

Select/import scoped input -> validate limits and permission -> show actual processing state -> explain result and confidence -> review/triage where appropriate -> export -> recover in clean environment. Loading, empty, stale, partial, unauthorized, rejected input, timeout/cancel and permanent failure are explicit. Provide table/keyboard alternatives to canvas, charts and graph paths. No sensitive content in page telemetry.
