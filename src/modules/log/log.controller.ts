import { Controller, Get, Query } from "@nestjs/common";
import { ApiTags, ApiOperation, ApiBearerAuth } from "@nestjs/swagger";
import { LogService } from "./log.service";
import { PaginationDto } from "../../common/dto/pagination.dto";
import { Permissions } from "../../common/decorators/permissions.decorator";

@ApiTags("操作日志")
@ApiBearerAuth()
@Controller("logs")
export class LogController {
  constructor(private logService: LogService) {}

  @Get()
  @Permissions("log:list")
  @ApiOperation({ summary: "日志列表" })
  findAll(@Query() query: PaginationDto & { module?: string; userId?: string }) {
    return this.logService.findAll(query);
  }
}
