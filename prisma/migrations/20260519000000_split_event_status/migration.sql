-- AlterTable: Add new columns with defaults
ALTER TABLE "event" ADD COLUMN "publish_status" TEXT NOT NULL DEFAULT 'draft';
ALTER TABLE "event" ADD COLUMN "group_draw_completed" BOOLEAN NOT NULL DEFAULT false;
ALTER TABLE "event" ADD COLUMN "admin_confirmed" BOOLEAN NOT NULL DEFAULT false;

-- Data migration: map old status to new fields
UPDATE "event" SET "publish_status" = "status" WHERE "status" IN ('draft', 'published');
UPDATE "event" SET "publish_status" = 'published', "admin_confirmed" = true WHERE "status" = 'ended';

-- DropColumn: remove old status column
ALTER TABLE "event" DROP COLUMN "status";
